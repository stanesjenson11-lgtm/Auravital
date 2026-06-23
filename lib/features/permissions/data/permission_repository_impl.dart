import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import '../domain/aura_permission_status.dart';
import '../domain/permission_repository.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  static const _channel = MethodChannel('auravitals/permissions');

  @override
  Future<AuraPermissionStatus> status() async {
    final usageAccess = await _channel.invokeMethod<bool>('hasUsageAccess') ?? false;
    final battery = await _channel.invokeMethod<bool>('isIgnoringBatteryOptimizations') ?? false;
    return AuraPermissionStatus(
      activityRecognition: await Permission.activityRecognition.isGranted,
      notifications: await Permission.notification.isGranted,
      usageAccess: usageAccess,
      batteryUnrestricted: battery,
    );
  }

  @override
  Future<void> requestRuntimePermissions() async {
    await Permission.activityRecognition.request();
    await Permission.notification.request();
    await _channel.invokeMethod<bool>('requestActivityRecognition');
  }

  @override
  Future<void> openUsageAccessSettings() async {
    await _channel.invokeMethod<bool>('openUsageAccessSettings');
  }

  @override
  Future<void> openBatteryOptimizationSettings() async {
    await _channel.invokeMethod<bool>('openBatteryOptimizationSettings');
  }
}
