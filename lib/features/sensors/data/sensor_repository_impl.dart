import '../domain/health_metric_sample.dart';
import '../domain/sensor_repository.dart';
import 'native_sensor_data_source.dart';

class SensorRepositoryImpl implements SensorRepository {
  const SensorRepositoryImpl(this._dataSource);

  final NativeSensorDataSource _dataSource;

  @override
  Future<void> startCollection() => _dataSource.start();

  @override
  Future<HealthMetricSample> collectCurrentAggregate() => _dataSource.snapshot();
}
