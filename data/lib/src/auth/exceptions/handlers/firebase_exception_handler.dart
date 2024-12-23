import 'package:firebase_auth/firebase_auth.dart';

import '../auth_exceptions.dart';
import '../mappers/exception_mapper.dart';
import 'exception_handler.dart';

class FirebaseExceptionHandler implements ExceptionsHandler {
  final ExceptionsMapper _firebaseExceptionsMapper;

  FirebaseExceptionHandler({
    required ExceptionsMapper firebaseExceptionsMapper,
  }) : _firebaseExceptionsMapper = firebaseExceptionsMapper;

  @override
  Future<T> safeExecute<T>({
    required Future<T> Function() execute,
  }) {
    {
      try {
        return execute();
      } on FirebaseAuthException catch (e) {
        throw _firebaseExceptionsMapper.map(e);
      } catch (_) {
        throw GenericAuthException();
      }
    }
  }
}
