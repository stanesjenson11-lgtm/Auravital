import '../../../core/data/local/app_database.dart';

abstract interface class DashboardRepository {
  Stream<List<DailyMetric>> watchMetrics();
  Stream<List<RiskPrediction>> watchPredictions();
}
