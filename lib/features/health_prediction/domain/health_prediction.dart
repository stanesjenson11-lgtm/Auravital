class HealthPrediction {
  const HealthPrediction({
    required this.date,
    required this.stressRisk,
    required this.sleepRisk,
    required this.wellnessRisk,
    required this.confidence,
  });

  final DateTime date;
  final double stressRisk;
  final double sleepRisk;
  final double wellnessRisk;
  final double confidence;

  int get wellnessScore => (100 - wellnessRisk).round().clamp(0, 100);
}
