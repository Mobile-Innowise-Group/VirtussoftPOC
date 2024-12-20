import 'package:dio/dio.dart';
import '../../data.dart';
import 'api_query.dart';

class ApiProvider {
  final Dio _dio;
  final ErrorHandler _errorHandler;
  final TokenProvider _tokenProvider;

  ApiProvider({
    required Dio dio,
    required ErrorHandler errorHandler,
    required TokenProvider tokenProvider,
  })  : _dio = dio,
        _errorHandler = errorHandler,
        _tokenProvider = tokenProvider;

  Future<T> get<T>(
    ApiQuery query, {
    required Parser<T> parser,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return _safeRequest<T>(
        request: _dio.get(
          query.path,
          queryParameters: query.params,
          options: Options(
            headers: headers,
          ),
        ),
        parser: parser,
      );
    } on DioException catch (e) {
      await _errorHandler.handleError(e);
    }
  }

  Future<T> post<T>(
    ApiQuery query, {
    required Parser<T> parser,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return _safeRequest<T>(
        request: _dio.post(
          query.path,
          data: query.data,
          queryParameters: query.params,
          options: Options(
            headers: headers,
          ),
        ),
        parser: parser,
      );
    } on DioException catch (e) {
      await _errorHandler.handleError(e);
    }
  }

  Future<T> put<T>(
    ApiQuery query, {
    required Parser<T> parser,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return _safeRequest<T>(
        request: _dio.put(
          query.path,
          data: query.body,
          queryParameters: query.params,
          options: Options(
            headers: headers,
          ),
        ),
        parser: parser,
      );
    } on DioException catch (e) {
      await _errorHandler.handleError(e);
    }
  }

  Future<T> patch<T>(
    ApiQuery query, {
    required Parser<T> parser,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return _safeRequest<T>(
        request: _dio.patch(
          query.path,
          data: query.body,
          queryParameters: query.params,
          options: Options(
            headers: headers,
          ),
        ),
        parser: parser,
      );
    } on DioException catch (e) {
      await _errorHandler.handleError(e);
    }
  }

  Future<T> delete<T>(
    ApiQuery query, {
    required Parser<T> parser,
    Map<String, dynamic>? headers,
    bool isAuth = true,
  }) async {
    try {
      return _safeRequest<T>(
        request: _dio.delete(
          query.path,
          data: query.body,
          queryParameters: query.params,
          options: Options(
            headers: headers,
          ),
        ),
        parser: parser,
      );
    } on DioException catch (e) {
      await _errorHandler.handleError(e);
    }
  }

  Future<T> _safeRequest<T>({
    required Future<Response<dynamic>> request,
    required Parser<T> parser,
  }) async {
    final Response<dynamic> response = await request;
    return parser(response.data);
  }
}

typedef Parser<T> = T Function(Map<String, dynamic>);
