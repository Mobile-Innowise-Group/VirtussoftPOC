import 'package:domain/domain.dart';

import '../auth.dart';
import '../entities/entities.dart';
import '../mappers/mappers.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationProvider _authProvider;

  AuthorizationRepositoryImpl({
    required AuthorizationProvider authProvider,
  }) : _authProvider = authProvider;

  @override
  Future<UserModel?> signUpWithCredentials({
    required SignUpPayloadModel signUpPayloadModel,
  }) async {
    final UserEntity? userEntity = await _authProvider.signUpWithCredentials(
      signUpPayloadEntity: SignUpPayloadMapper.toEntity(signUpPayloadModel),
    );

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<UserModel?> signInWithCredentials({
    required SignInPayloadModel signInPayloadModel,
  }) async {
    final UserEntity? userEntity = await _authProvider.signInWithCredentials(
      signInPayloadEntity: SignInPayloadMapper.toEntity(signInPayloadModel),
    );

    return UserMapper.fromEntity(userEntity);
  }

  @override
  UserModel? getCurrentUser() {
    return UserMapper.fromEntity(_authProvider.getCurrentUser());
  }

  @override
  Future<UserModel?> signInWithSessionId() async {
    final UserEntity? userEntity = await _authProvider.signInWithSessionId();

    return UserMapper.fromEntity(userEntity);
  }

  @override
  Future<void> signOut() async => _authProvider.signOut();
}
