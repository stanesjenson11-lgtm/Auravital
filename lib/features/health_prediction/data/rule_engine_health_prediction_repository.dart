import 'dart:math';

import '../../analytics/domain/baseline_repository.dart';
import '../../sensors/domain/health_metric_sample.dart';
import '../domain/health_prediction.dart';
import '../domain/health_prediction_repository.dart';

class RuleEngineHealthPredictionRepository implements HealthPredictionRepository {
  RuleEngineHealthPredictionRepository(this._baselineRepository);

  final BaselineRepository _baselineRepository;

  @override
  Future<HealthPrediction> predict(HealthMetricSample sample) async {
    final baseline = await _baselineRepository.baselines();
    final screenSpike = _positiveZ(sample.screenTimeMinutes, baseline['screenTimeMinutes']);
    final unlockSpike = _positiveZ(sample.unlockCount, baseline['unlockCount']);
    final nightSpike = _positiveZ(sample.nightUsageMinutes, baseline['nightUsageMinutes']);
    final activityDrop = _negativeZ(sample.steps, baseline['steps']);
    final walkingDrop = _negativeZ(sample.walkingMinutes, baseline['walkingMinutes']);

    final stress = _score((screenSpike * 0.35) + (unlockSpike * 0.35) + (activityDrop * 0.30));
    final sleep = _score((nightSpike * 0.55) + (unlockSpike * 0.20) + (activityDrop * 0.25));
    final wellness = _score((activityDrop * 0.35) + (walkingDrop * 0.20) + (stress / 100 * 0.25) + (sleep / 100 * 0.20));
    final days = await _baselineRepository.calibrationDaysCollected();
    final confidence = (0.35 + (days / 14 * 0.65)).clamp(0.35, 0.98);

    return HealthPrediction(
      date: sample.date,
      stressRisk: stress,
      sleepRisk: sleep,
      wellnessRisk: wellness,
      confidence: confidence,
    );
  }

  double _positiveZ(num value, dynamic baseline) {
    if (baseline == null) return 0.5;
    return max(0, (value - baseline.mean) / baseline.standardDeviation).toDouble();
  }

  double _negativeZ(num value, dynamic baseline) {
    if (baseline == null) return 0.5;
    return max(0, (baseline.mean - value) / baseline.standardDeviation).toDouble();
  }

  double _score(double weightedZ) {
    final score = 100 * (1 - exp(-weightedZ / 2.2));
    return score.clamp(0, 100);
  }
}
