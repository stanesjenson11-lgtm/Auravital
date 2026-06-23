import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/analytics/data/baseline_repository_impl.dart';
import '../../features/analytics/domain/baseline_repository.dart';
import '../../features/health_prediction/data/rule_engine_health_prediction_repository.dart';
import '../../features/health_prediction/domain/health_prediction_repository.dart';
import '../../features/permissions/data/permission_repository_impl.dart';
import '../../features/permissions/domain/permission_repository.dart';
import '../../features/sensors/data/native_sensor_data_source.dart';
import '../../features/sensors/data/sensor_repository_impl.dart';
import '../../features/sensors/domain/sensor_repository.dart';
import '../data/local/app_database.dart';
import '../security/secure_settings_store.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase.defaults();
  ref.onDispose(database.close);
  return database;
});

final secureSettingsStoreProvider = Provider<SecureSettingsStore>((ref) {
  return const SecureSettingsStore();
});

final permissionRepositoryProvider = Provider<PermissionRepository>((ref) {
  return PermissionRepositoryImpl();
});

final sensorRepositoryProvider = Provider<SensorRepository>((ref) {
  return SensorRepositoryImpl(NativeSensorDataSource());
});

final baselineRepositoryProvider = Provider<BaselineRepository>((ref) {
  return BaselineRepositoryImpl(ref.watch(databaseProvider));
});

final healthPredictionRepositoryProvider =
    Provider<HealthPredictionRepository>((ref) {
  return RuleEngineHealthPredictionRepository(
    ref.watch(baselineRepositoryProvider),
  );
});
