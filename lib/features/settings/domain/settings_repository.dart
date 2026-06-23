abstract interface class SettingsRepository {
  Future<String> exportCsv();
  Future<void> deleteData();
  Future<void> resetBaseline();
}
