import 'package:drift/drift.dart';

import '../../../core/data/local/app_database.dart';
import '../../health_prediction/domain/health_prediction.dart';
import '../../health_prediction/domain/health_prediction_repository.dart';
import '../../sensors/domain/health_metric_sample.dart';
import '../../sensors/domain/sensor_repository.dart';
import 'baseline_repository.dart';

class HealthAnalyticsEngine {
  HealthAnalyticsEngine({
    required SensorRepository sensors,
    required BaselineRepository baselineRepository,
    required HealthPredictionRepository predictionRepository,
    required AppDatabase database,
  })  : _sensors = sensors,
        _baselineRepository = baselineRepository,
        _predictionRepository = predictionRepository,
        _database = database;

  final SensorRepository _sensors;
  final BaselineRepository _baselineRepository;
  final HealthPredictionRepository _predictionRepository;
  final AppDatabase _database;

  Future<HealthPrediction> collectAndPredict() async {
    await _sensors.startCollection();
    final sample = await _sensors.collectCurrentAggregate();
    await _saveSample(sample);
    await _baselineRepository.updateFromRecentMetrics();
    final prediction = await _predictionRepository.predict(sample);
    await _savePrediction(prediction);
    return prediction;
  }

  Future<void> _saveSample(HealthMetricSample sample) {
    return _database.upsertDailyMetric(
      DailyMetricsCompanion.insert(
        date: normalizedDate(sample.date),
        steps: Value(sample.steps),
        screenTimeMinutes: Value(sample.screenTimeMinutes),
        unlockCount: Value(sample.unlockCount),
        walkingMinutes: Value(sample.walkingMinutes),
        sedentaryMinutes: Value(sample.sedentaryMinutes),
        nightUsageMinutes: Value(sample.nightUsageMinutes),
        appOpenFrequency: Value(sample.appOpenFrequency),
        deviceInteractionFrequency: Value(sample.deviceInteractionFrequency),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _savePrediction(HealthPrediction prediction) {
    return _database.upsertPrediction(
      RiskPredictionsCompanion.insert(
        date: normalizedDate(prediction.date),
        stressScore: prediction.stressRisk,
        sleepScore: prediction.sleepRisk,
        wellnessScore: 100 - prediction.wellnessRisk,
        confidence: prediction.confidence,
      ),
    );
  }
}
