import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data.dart';

class UserSessionProviderImpl implements UserSessionProvider {
  static const String _sessionIdKey = 'sessionId';
  final FlutterSecureStorage _storage;

  UserSessionProviderImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  Future<void> clearSession() {
    return _storage.delete(key: _sessionIdKey);
  }

  @override
  Future<void> saveSession({
    required String sessionId,
  }) async {
    await _storage.write(key: _sessionIdKey, value: sessionId);
  }

  @override
  Future<String?> readSession() async {
    final Map<String, String> sessions = await _storage.readAll();
    return sessions[_sessionIdKey];
  }
}
