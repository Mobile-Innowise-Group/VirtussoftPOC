import 'package:core/core.dart';

import '../../domain.dart';

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

    locator.registerLazySingleton<GetUserCategoriesUseCase>(
      () => GetUserCategoriesUseCase(
        categoryRepository: locator<CategoryRepository>(),
      ),
    );

    locator.registerLazySingleton<SignInWithCredentialsUseCase>(
      () => SignInWithCredentialsUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignInWithSessionIdUseCase>(
      () => SignInWithSessionIdUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignUpWithCredentialsUseCase>(
      () => SignUpWithCredentialsUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<GetFoldersUseCase>(
      () => GetFoldersUseCase(
        folderRepository: locator.get<FolderRepository>(),
      ),
    );

    locator.registerLazySingleton<CreateFolderUseCase>(
      () => CreateFolderUseCase(
        folderRepository: locator.get<FolderRepository>(),
      ),
    );

    locator.registerLazySingleton<DeleteFolderUseCase>(
      () => DeleteFolderUseCase(
        folderRepository: locator.get<FolderRepository>(),
      ),
    );

    locator.registerLazySingleton<SynchronizeDataUseCase>(
      () => SynchronizeDataUseCase(
          synchronizationRepository: locator.get<SynchronizationRepository>()),
    );
  }
}
