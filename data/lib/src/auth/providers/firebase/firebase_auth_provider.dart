import 'package:firebase_auth/firebase_auth.dart';

import '../../auth.dart';
import '../../entities/entities.dart';
import '../../exceptions/auth_exceptions.dart';
import '../../exceptions/handlers/exception_handler.dart';
import '../../mappers/mappers.dart';

class FirebaseAuthProvider implements AuthorizationProvider {
  final FirebaseAuth _firebaseAuth;
  final ExceptionsHandler _firebaseExceptionsHandler;

  FirebaseAuthProvider({
    required FirebaseAuth firebaseAuth,
    required ExceptionsHandler firebaseExceptionsHandler,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseExceptionsHandler = firebaseExceptionsHandler;

  @override
  UserEntity? getCurrentUser() {
    final User? firebaseUser = _firebaseAuth.currentUser;
    return UserMapper.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserEntity?> signUpWithCredentials({
    required SignUpPayloadEntity signUpPayloadEntity,
  }) async {
    return _firebaseExceptionsHandler.safeExecute<UserEntity?>(
      execute: () async {
        final UserCredential userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: signUpPayloadEntity.email,
          password: signUpPayloadEntity.password,
        );

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          return UserMapper.fromFirebaseUser(firebaseUser);
        } else {
          throw InvalidCredentialsAuthException();
        }
      },
    );
  }

  @override
  Future<UserEntity?> signInWithCredentials({
    required SignInPayloadEntity signInPayloadEntity,
  }) async {
    return _firebaseExceptionsHandler.safeExecute<UserEntity?>(
      execute: () async {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
          email: signInPayloadEntity.login,
          password: signInPayloadEntity.password,
        );

        final User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          return UserMapper.fromFirebaseUser(firebaseUser);
        } else {
          throw UserNotSignedInAuthException();
        }
      },
    );
  }

  @override
  Future<UserEntity?> signInWithSessionId() {
    final User? firebaseUser = _firebaseAuth.currentUser;

    return Future<UserEntity?>.value(UserMapper.fromFirebaseUser(firebaseUser));
  }

  @override
  Future<void> signOut() async {
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotSignedInAuthException();
    }
  }
}
