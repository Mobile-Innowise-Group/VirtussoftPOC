import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';
import '../categories/categories.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
  }

  static void _initApi(GetIt locator) {
    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );

    locator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: locator<AppEventNotifier>(),
      ),
    );

    locator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        tokenProvider: locator<TokenProvider>(),
        dio: locator<DioConfig>().dio,
        errorHandler: locator<ErrorHandler>(),
      ),
    );
  }

  static void _initProviders(GetIt locator) {
    locator.registerLazySingleton<CategoryRemoteDataSource>(
      CategoryRemoteDataSourceImpl.new,
    );

    locator.registerLazySingleton<CategoryLocalDataSource>(
      CategoryLocalDataSourceImpl.new,
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(
        categoryRemoteDataSource: locator<CategoryRemoteDataSource>(),
        categoryLocalDataSource: locator<CategoryLocalDataSource>(),
      ),
    );
  }
}
