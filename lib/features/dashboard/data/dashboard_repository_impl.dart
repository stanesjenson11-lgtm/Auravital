import '../../../core/data/local/app_database.dart';
import '../domain/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Stream<List<DailyMetric>> watchMetrics() => _database.watchLatestMetrics(14);

  @override
  Stream<List<RiskPrediction>> watchPredictions() => _database.watchLatestPredictions(14);
}
