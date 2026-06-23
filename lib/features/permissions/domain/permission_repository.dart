import 'aura_permission_status.dart';

abstract interface class PermissionRepository {
  Future<AuraPermissionStatus> status();
  Future<void> requestRuntimePermissions();
  Future<void> openUsageAccessSettings();
  Future<void> openBatteryOptimizationSettings();
}
