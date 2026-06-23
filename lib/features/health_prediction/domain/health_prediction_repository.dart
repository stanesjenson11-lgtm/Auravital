import '../../sensors/domain/health_metric_sample.dart';
import 'health_prediction.dart';

abstract interface class HealthPredictionRepository {
  Future<HealthPrediction> predict(HealthMetricSample sample);
}
