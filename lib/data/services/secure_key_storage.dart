import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// API keys live only here (Android Keystore-backed), never in the Drift
/// database or in plain text. Keyed per provider id so switching providers
/// back and forth never overwrites another provider's saved key.
class SecureKeyStorage {
  static const _prefix = 'ai_api_key_';

  final FlutterSecureStorage _storage;

  SecureKeyStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  Future<void> setKey(String providerId, String apiKey) {
    return _storage.write(key: '$_prefix$providerId', value: apiKey);
  }

  Future<String?> getKey(String providerId) {
    return _storage.read(key: '$_prefix$providerId');
  }

  Future<void> deleteKey(String providerId) {
    return _storage.delete(key: '$_prefix$providerId');
  }
}
