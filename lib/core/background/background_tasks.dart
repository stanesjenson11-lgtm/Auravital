import '../../features/analytics/data/baseline_repository_impl.dart';
import '../../features/analytics/domain/health_analytics_engine.dart';
import '../../features/health_prediction/data/rule_engine_health_prediction_repository.dart';
import '../../features/notifications/data/local_notification_service.dart';
import '../../features/notifications/domain/notification_policy.dart';
import '../../features/sensors/data/sensor_repository_impl.dart';
import '../../features/sensors/data/native_sensor_data_source.dart';
import '../data/local/app_database.dart';

class BackgroundTasks {
  static const periodicTaskId = 'auravitals-passive-monitoring';
  static const periodicTaskName = 'auravitals.collect.aggregate.predict';

  static Future<bool> runMonitoringCycle() async {
    final database = AppDatabase.defaults();
    try {
      final sensors = SensorRepositoryImpl(NativeSensorDataSource());
      final baseline = BaselineRepositoryImpl(database);
      final predictor = RuleEngineHealthPredictionRepository(baseline);
      final analytics = HealthAnalyticsEngine(
        sensors: sensors,
        baselineRepository: baseline,
        predictionRepository: predictor,
        database: database,
      );
      final prediction = await analytics.collectAndPredict();
      await LocalNotificationService.instance.initialize();
      await NotificationPolicy().notifyIfActionable(prediction);
      return true;
    } finally {
      await database.close();
    }
  }
}
