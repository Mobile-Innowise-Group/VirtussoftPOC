import 'package:auth/src/data/lib/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseExceptionMapper implements ExceptionsMapper<AuthException> {
  @override
  Exception map(AuthException exception) {
    return switch (exception.code) {
      'bad_jwt' => TokenInvalidAuthException(),
      'email_exists' => EmailAlreadyInUseAuthException(),
      'invalid_credentials' => InvalidCredentialsAuthException(),
      _ => GenericAuthException(),
    };
  }
}
