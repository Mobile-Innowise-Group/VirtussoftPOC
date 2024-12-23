import 'package:dio/dio.dart';

import '../auth_exceptions.dart';
import '../mappers/exception_mapper.dart';
import 'exception_handler.dart';

class DioExceptionHandler implements ExceptionsHandler {
  final ExceptionsMapper _dioExceptionsMapper;

  DioExceptionHandler({
    required ExceptionsMapper dioExceptionsMapper,
  }) : _dioExceptionsMapper = dioExceptionsMapper;

  @override
  Future<T> safeExecute<T>({
    required Future<T> Function() execute,
  }) {
    {
      try {
        return execute();
      } on DioException catch (e) {
        throw _dioExceptionsMapper.map(e);
      } catch (_) {
        throw GenericAuthException();
      }
    }
  }
}
