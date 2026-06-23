class HealthMetricSample {
  const HealthMetricSample({
    required this.date,
    required this.steps,
    required this.screenTimeMinutes,
    required this.unlockCount,
    required this.walkingMinutes,
    required this.sedentaryMinutes,
    required this.nightUsageMinutes,
    required this.appOpenFrequency,
    required this.deviceInteractionFrequency,
  });

  final DateTime date;
  final int steps;
  final int screenTimeMinutes;
  final int unlockCount;
  final int walkingMinutes;
  final int sedentaryMinutes;
  final int nightUsageMinutes;
  final int appOpenFrequency;
  final int deviceInteractionFrequency;
}
