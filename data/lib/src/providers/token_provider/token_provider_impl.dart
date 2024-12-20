import 'dart:async';

import '../../../data.dart';

class TokenProviderImpl implements TokenProvider {
  final LocalDataProvider _localDataProvider;

  TokenProviderImpl({
    required LocalDataProvider sharedPreferencesProvider,
  }) : _localDataProvider = sharedPreferencesProvider;

  @override
  Future<String?> readAccessToken() async {
    return null;
  }

  @override
  Future<void> updateTokens() async {}
}
