import '../../../core/security/secure_settings_store.dart';

class OnboardingRepositoryImpl {
  OnboardingRepositoryImpl(this._store);

  final SecureSettingsStore _store;

  Future<void> complete() => _store.writeBool('onboarding_complete', true);
  Future<bool> isComplete() => _store.readBool('onboarding_complete');
}
