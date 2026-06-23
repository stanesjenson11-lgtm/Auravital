import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/local/app_database.dart';
import '../../../core/providers/app_providers.dart';
import '../../analytics/domain/health_analytics_engine.dart';
import '../../analytics/domain/recommendations_engine.dart';

final monitoringCycleProvider = FutureProvider.autoDispose<void>((ref) async {
  final engine = HealthAnalyticsEngine(
    sensors: ref.watch(sensorRepositoryProvider),
    baselineRepository: ref.watch(baselineRepositoryProvider),
    predictionRepository: ref.watch(healthPredictionRepositoryProvider),
    database: ref.watch(databaseProvider),
  );
  await engine.collectAndPredict();
});

final latestMetricsProvider = StreamProvider.autoDispose<List<DailyMetric>>((ref) {
  return ref.watch(databaseProvider).watchLatestMetrics(14);
});

final latestPredictionsProvider = StreamProvider.autoDispose<List<RiskPrediction>>((ref) {
  return ref.watch(databaseProvider).watchLatestPredictions(14);
});

final calibrationProvider = FutureProvider.autoDispose<CalibrationState>((ref) async {
  final baseline = ref.watch(baselineRepositoryProvider);
  return CalibrationState(
    days: await baseline.calibrationDaysCollected(),
    accuracy: await baseline.calibrationAccuracy(),
  );
});

final recommendationsProvider = Provider.autoDispose<List<String>>((ref) {
  final metrics = ref.watch(latestMetricsProvider).value ?? const <DailyMetric>[];
  final predictions = ref.watch(latestPredictionsProvider).value ?? const <RiskPrediction>[];
  return RecommendationsEngine().generate(
    today: metrics.isEmpty ? null : metrics.first,
    history: metrics,
    prediction: predictions.isEmpty ? null : predictions.first,
  );
});

class CalibrationState {
  const CalibrationState({required this.days, required this.accuracy});

  final int days;
  final double accuracy;
}
