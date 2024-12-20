import 'package:supabase_flutter/supabase_flutter.dart';

import '../auth_exceptions.dart';
import '../mappers/exception_mapper.dart';
import 'exception_handler.dart';

class SupabaseExceptionHandler implements ExceptionsHandler {
  final ExceptionsMapper _supabaseExceptionsMapper;

  SupabaseExceptionHandler({
    required ExceptionsMapper supabaseExceptionsMapper,
  }) : _supabaseExceptionsMapper = supabaseExceptionsMapper;

  @override
  Future<T> safeExecute<T>({
    required Future<T> Function() execute,
  }) {
    try {
      return execute();
    } on AuthException catch (e) {
      throw _supabaseExceptionsMapper.map(e);
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
