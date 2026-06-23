import 'package:flutter/services.dart';

import '../domain/health_metric_sample.dart';

class NativeSensorDataSource {
  static const _channel = MethodChannel('auravitals/sensors');

  Future<void> start() async {
    await _channel.invokeMethod<bool>('start');
  }

  Future<HealthMetricSample> snapshot() async {
    final raw = await _channel.invokeMapMethod<String, dynamic>('snapshot');
    final data = raw ?? const <String, dynamic>{};
    return HealthMetricSample(
      date: DateTime.tryParse('${data['date']}') ?? DateTime.now(),
      steps: _int(data['steps']),
      screenTimeMinutes: _int(data['screenTimeMinutes']),
      unlockCount: _int(data['unlockCount']),
      walkingMinutes: _int(data['walkingMinutes']),
      sedentaryMinutes: _int(data['sedentaryMinutes']),
      nightUsageMinutes: _int(data['nightUsageMinutes']),
      appOpenFrequency: _int(data['appOpenFrequency']),
      deviceInteractionFrequency: _int(data['deviceInteractionFrequency']),
    );
  }

  int _int(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse('$value') ?? 0;
  }
}
