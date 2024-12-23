import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data.dart';

class TokenProviderImpl implements TokenProvider {
  static const String _accessToken = 'accessToken';
  final FlutterSecureStorage _storage;

  TokenProviderImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  Future<String?> readToken() async {
    final Map<String, String> tokens = await _storage.readAll();
    return tokens[_accessToken];
  }

  @override
  Future<void> writeToken({required String token}) async {
    await _storage.write(key: _accessToken, value: token);
  }

  @override
  Future<void> clearToken() {
    return _storage.delete(key: _accessToken);
  }
}
