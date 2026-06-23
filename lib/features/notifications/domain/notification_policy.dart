import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../health_prediction/domain/health_prediction.dart';
import '../data/local_notification_service.dart';

class NotificationPolicy {
  NotificationPolicy();

  static const _storage = FlutterSecureStorage(aOptions: AndroidOptions());

  Future<void> notifyIfActionable(HealthPrediction prediction) async {
    final now = DateTime.now();
    final lastRaw = await _storage.read(key: 'last_risk_notification_at');
    final last = lastRaw == null ? null : DateTime.tryParse(lastRaw);
    if (last != null && now.difference(last) < const Duration(hours: 6)) return;

    var sent = false;
    if (prediction.stressRisk >= 75) {
      await LocalNotificationService.instance.showRiskAlert(
        id: 1001,
        title: 'High Stress Risk Detected',
        body: 'Your device interaction pattern is above baseline today.',
      );
      sent = true;
    } else if (prediction.sleepRisk >= 75) {
      await LocalNotificationService.instance.showRiskAlert(
        id: 1002,
        title: 'Sleep Pattern Changed',
        body: 'Nighttime usage is elevated compared with your baseline.',
      );
      sent = true;
    } else if (prediction.wellnessRisk >= 75) {
      await LocalNotificationService.instance.showRiskAlert(
        id: 1003,
        title: 'Activity Level Below Baseline',
        body: 'Your activity and wellness pattern may need attention today.',
      );
      sent = true;
    }
    if (sent) {
      await _storage.write(key: 'last_risk_notification_at', value: now.toIso8601String());
    }
  }
}
