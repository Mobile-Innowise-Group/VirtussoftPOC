import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth.dart';
import '../../entities/entities.dart';
import '../../exceptions/auth_exceptions.dart';
import '../../exceptions/handlers/exception_handler.dart';
import '../../mappers/mappers.dart';

class SupabaseAuthProvider implements AuthorizationProvider {
  final SupabaseClient _supabaseClient;
  final ExceptionsHandler _supabaseExceptionHandler;

  SupabaseAuthProvider({
    required SupabaseClient supabaseClient,
    required ExceptionsHandler supabaseExceptionHandler,
  })  : _supabaseClient = supabaseClient,
        _supabaseExceptionHandler = supabaseExceptionHandler;

  @override
  Future<UserEntity?> getCurrentUser() {
    return Future<UserEntity?>.value(
        UserMapper.fromSupabaseUser(_supabaseClient.auth.currentUser));
  }

  @override
  Future<UserEntity?> signUpWithCredentials({
    required SignUpPayloadEntity signUpPayloadEntity,
  }) async {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final AuthResponse authResponse = await _supabaseClient.auth.signUp(
          email: signUpPayloadEntity.login,
          password: signUpPayloadEntity.password,
        );

        final User? authUser = authResponse.user;

        if (authUser != null) {
          return UserMapper.fromSupabaseUser(authUser);
        } else {
          throw UserNotSignedInAuthException();
        }
      },
    );
  }

  @override
  Future<UserEntity?> signInWithCredentials({
    required SignInPayloadEntity signInPayloadEntity,
  }) async {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final AuthResponse authResponse =
            await _supabaseClient.auth.signInWithPassword(
          email: signInPayloadEntity.login,
          password: signInPayloadEntity.password,
        );

        final User? authUser = authResponse.user;

        if (authUser != null) {
          return UserMapper.fromSupabaseUser(authUser);
        } else {
          throw UserNotSignedInAuthException();
        }
      },
    );
  }

  @override
  Future<UserEntity?> signInWithSessionId() {
    final User? supabaseUser = _supabaseClient.auth.currentUser;

    return Future<UserEntity?>.value(UserMapper.fromSupabaseUser(supabaseUser));
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }
}
