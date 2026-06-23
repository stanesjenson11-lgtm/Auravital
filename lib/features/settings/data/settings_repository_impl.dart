import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/data/local/app_database.dart';
import '../domain/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Future<String> exportCsv() async {
    final metrics = await _database.latestMetrics(10000);
    final buffer = StringBuffer()
      ..writeln('date,steps,screenTimeMinutes,unlockCount,walkingMinutes,sedentaryMinutes,nightUsageMinutes,appOpenFrequency,deviceInteractionFrequency');
    final formatter = DateFormat('yyyy-MM-dd');
    for (final item in metrics.reversed) {
      buffer.writeln([
        formatter.format(item.date),
        item.steps,
        item.screenTimeMinutes,
        item.unlockCount,
        item.walkingMinutes,
        item.sedentaryMinutes,
        item.nightUsageMinutes,
        item.appOpenFrequency,
        item.deviceInteractionFrequency,
      ].join(','));
    }
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/auravitals_export.csv');
    await file.writeAsString(buffer.toString(), flush: true);
    return file.path;
  }

  @override
  Future<void> deleteData() => _database.clearHealthData();

  @override
  Future<void> resetBaseline() => _database.clearBaselines();
}
