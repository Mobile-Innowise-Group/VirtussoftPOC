import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../auth.dart';
import '../../entities/entities.dart';
import '../../exceptions/handlers/exception_handler.dart';

class CustomAuthProviderImpl implements AuthorizationProvider {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  final ExceptionsHandler _customExceptionHandler;

  CustomAuthProviderImpl({
    required Dio dio,
    required FlutterSecureStorage storage,
    required ExceptionsHandler customExceptionHandler,
  })  : _dio = dio,
        _storage = storage,
        _customExceptionHandler = customExceptionHandler;

  @override
  Future<UserEntity?> signUpWithCredentials({
    required SignUpPayloadEntity signUpPayloadEntity,
  }) async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        return null;
      },
    );
  }

  @override
  Future<UserEntity?> signInWithCredentials({
    required SignInPayloadEntity signInPayloadEntity,
  }) async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        return null;
      },
    );
  }

  @override
  Future<UserEntity?> signInWithSessionId() async {
    return _customExceptionHandler.safeExecute(
      execute: () async {
        return null;
      },
    );
  }

  @override
  UserEntity? getCurrentUser() {
    return null;
  }

  @override
  Future<void> signOut() async {
    await _storage.deleteAll();
  }
}
