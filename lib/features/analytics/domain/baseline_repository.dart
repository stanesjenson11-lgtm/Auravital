import '../../../core/data/local/app_database.dart';

abstract interface class BaselineRepository {
  Future<void> updateFromRecentMetrics();
  Future<Map<String, BaselineMetric>> baselines();
  Future<int> calibrationDaysCollected();
  Future<double> calibrationAccuracy();
  Future<void> reset();
}
