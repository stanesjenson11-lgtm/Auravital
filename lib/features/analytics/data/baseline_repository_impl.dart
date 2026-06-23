import 'dart:math';

import '../../../core/data/local/app_database.dart';
import '../domain/baseline_repository.dart';

class BaselineRepositoryImpl implements BaselineRepository {
  BaselineRepositoryImpl(this._database);

  final AppDatabase _database;

  static const calibrationDays = 14;

  @override
  Future<void> updateFromRecentMetrics() async {
    final metrics = await _database.latestMetrics(calibrationDays);
    if (metrics.isEmpty) return;
    final values = <String, List<double>>{
      'steps': metrics.map((m) => m.steps.toDouble()).toList(),
      'screenTimeMinutes': metrics.map((m) => m.screenTimeMinutes.toDouble()).toList(),
      'unlockCount': metrics.map((m) => m.unlockCount.toDouble()).toList(),
      'walkingMinutes': metrics.map((m) => m.walkingMinutes.toDouble()).toList(),
      'sedentaryMinutes': metrics.map((m) => m.sedentaryMinutes.toDouble()).toList(),
      'nightUsageMinutes': metrics.map((m) => m.nightUsageMinutes.toDouble()).toList(),
      'appOpenFrequency': metrics.map((m) => m.appOpenFrequency.toDouble()).toList(),
    };

    final now = DateTime.now();
    for (final entry in values.entries) {
      final mean = _mean(entry.value);
      final sd = _standardDeviation(entry.value, mean);
      await _database.upsertBaseline(
        BaselineMetricsCompanion.insert(
          metricName: entry.key,
          mean: mean,
          standardDeviation: max(sd, 1),
          updatedAt: now,
        ),
      );
    }
  }

  @override
  Future<Map<String, BaselineMetric>> baselines() async {
    final rows = await _database.allBaselines();
    return {for (final row in rows) row.metricName: row};
  }

  @override
  Future<int> calibrationDaysCollected() async {
    final metrics = await _database.latestMetrics(calibrationDays);
    return min(metrics.length, calibrationDays);
  }

  @override
  Future<double> calibrationAccuracy() async {
    final days = await calibrationDaysCollected();
    return (days / calibrationDays).clamp(0, 1);
  }

  @override
  Future<void> reset() => _database.clearBaselines();

  double _mean(List<double> values) {
    if (values.isEmpty) return 0;
    return values.reduce((a, b) => a + b) / values.length;
  }

  double _standardDeviation(List<double> values, double mean) {
    if (values.length < 2) return 1;
    final variance = values
            .map((value) => pow(value - mean, 2))
            .reduce((a, b) => a + b) /
        (values.length - 1);
    return sqrt(variance);
  }
}
