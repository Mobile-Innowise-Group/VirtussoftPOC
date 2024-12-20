import 'package:core/core.dart';

import '../categories/categories.dart';

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerLazySingleton<CreateCategoryUseCase>(
          () => CreateCategoryUseCase(
        categoryRepository: locator<CategoryRepository>(),
      ),
    );

    locator.registerLazySingleton<DeleteCategoryUseCase>(
          () => DeleteCategoryUseCase(
        categoryRepository: locator<CategoryRepository>(),
      ),
    );

    locator.registerLazySingleton<EditCategoryUseCase>(
          () => EditCategoryUseCase(
        categoryRepository: locator<CategoryRepository>(),
      ),
    );

    locator.registerLazySingleton<GetUserCategoriesUseCase>(
          () => GetUserCategoriesUseCase(
        categoryRepository: locator<CategoryRepository>(),
      ),
    );
  }
}
