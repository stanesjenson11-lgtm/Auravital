import 'health_metric_sample.dart';

abstract interface class SensorRepository {
  Future<void> startCollection();
  Future<HealthMetricSample> collectCurrentAggregate();
}
