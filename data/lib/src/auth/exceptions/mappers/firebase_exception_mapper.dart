import 'package:firebase_auth/firebase_auth.dart';

import '../auth_exceptions.dart';
import 'exception_mapper.dart';

class FirebaseExceptionMapper
    implements ExceptionsMapper<FirebaseAuthException> {
  @override
  Exception map(FirebaseAuthException exception) {
    return switch (exception.code) {
      'weak-password' => WeakPasswordAuthException(),
      'email-already-in-use' => EmailAlreadyInUseAuthException(),
      'invalid-email' => InvalidEmailAuthException(),
      'network-request-failed' => NetworkRequestFailed(),
      _ => GenericAuthException(),
    };
  }
}
