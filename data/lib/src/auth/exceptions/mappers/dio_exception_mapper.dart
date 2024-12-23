import 'package:core/core.dart';
import '../auth_exceptions.dart';
import 'exception_mapper.dart';

class DioExceptionMapper implements ExceptionsMapper<DioException> {
  @override
  Exception map(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        DioTimeoutException(),
      DioExceptionType.badResponse => switch (error.response?.statusCode) {
          StatusCode.unauthorized ||
          StatusCode.forbidden =>
            UserNotSignedInAuthException(),
          _ => DioBadResponseException(),
        },
      _ => GenericAuthException(),
    };
  }
}
