import 'package:tflite_flutter/tflite_flutter.dart';

import '../../sensors/domain/health_metric_sample.dart';
import '../domain/health_prediction.dart';
import '../domain/health_prediction_repository.dart';

class TfliteHealthPredictionRepository implements HealthPredictionRepository {
  TfliteHealthPredictionRepository({
    required Interpreter interpreter,
    required HealthPredictionRepository fallback,
  })  : _interpreter = interpreter,
        _fallback = fallback;

  final Interpreter _interpreter;
  final HealthPredictionRepository _fallback;

  @override
  Future<HealthPrediction> predict(HealthMetricSample sample) async {
    try {
      final input = [
        [
          sample.steps.toDouble(),
          sample.screenTimeMinutes.toDouble(),
          sample.unlockCount.toDouble(),
          sample.walkingMinutes.toDouble(),
          sample.nightUsageMinutes.toDouble(),
        ],
      ];
      final output = List.generate(1, (_) => List.filled(4, 0.0));
      _interpreter.run(input, output);
      final values = output.first;
      return HealthPrediction(
        date: sample.date,
        stressRisk: (values[0] * 100).clamp(0, 100),
        sleepRisk: (values[1] * 100).clamp(0, 100),
        wellnessRisk: (values[2] * 100).clamp(0, 100),
        confidence: values[3].clamp(0, 1),
      );
    } catch (_) {
      return _fallback.predict(sample);
    }
  }
}
