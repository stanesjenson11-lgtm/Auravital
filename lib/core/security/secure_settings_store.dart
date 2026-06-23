import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSettingsStore {
  const SecureSettingsStore();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  Future<void> writeBool(String key, bool value) {
    return _storage.write(key: key, value: value ? 'true' : 'false');
  }

  Future<bool> readBool(String key, {bool fallback = false}) async {
    final value = await _storage.read(key: key);
    return value == null ? fallback : value == 'true';
  }

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();
}
