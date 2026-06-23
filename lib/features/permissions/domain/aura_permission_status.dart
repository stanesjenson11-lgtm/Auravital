class AuraPermissionStatus {
  const AuraPermissionStatus({
    required this.activityRecognition,
    required this.notifications,
    required this.usageAccess,
    required this.batteryUnrestricted,
  });

  final bool activityRecognition;
  final bool notifications;
  final bool usageAccess;
  final bool batteryUnrestricted;

  bool get ready =>
      activityRecognition && notifications && usageAccess && batteryUnrestricted;
}
