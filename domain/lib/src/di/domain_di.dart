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

    locator.registerLazySingleton<GetAllFoldersUseCase>(
      () => GetAllFoldersUseCase(
        folderRepository: locator.get<FolderRepository>(),
      ),
    );

    locator.registerLazySingleton<GetPublicFoldersUseCase>(
      () => GetPublicFoldersUseCase(
        folderRepository: locator.get<FolderRepository>(),
      ),
    );

    locator.registerLazySingleton<GetPrivateFoldersUseCase>(
      () => GetPrivateFoldersUseCase(
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

    locator.registerLazySingleton<CreateScanEntryUseCase>(
      () => CreateScanEntryUseCase(
        scanEntriesRepository: locator.get<ScanEntriesRepository>(),
      ),
    );

    locator.registerLazySingleton<DeleteScanEntryUseCase>(
      () => DeleteScanEntryUseCase(
        scanEntriesRepository: locator.get<ScanEntriesRepository>(),
      ),
    );

    locator.registerLazySingleton<GetScanEntriesByFolderUseCase>(
      () => GetScanEntriesByFolderUseCase(
        scanEntriesRepository: locator.get<ScanEntriesRepository>(),
      ),
    );

    locator.registerLazySingleton<GetScanEntriesUseCase>(
      () => GetScanEntriesUseCase(
        scanEntriesRepository: locator.get<ScanEntriesRepository>(),
      ),
    );

    locator.registerLazySingleton<SynchronizeDataUseCase>(
      () => SynchronizeDataUseCase(synchronizationRepository: locator.get<SynchronizationRepository>()),
    );

    locator.registerLazySingleton<CreatePrivateFolderUseCase>(
      () => CreatePrivateFolderUseCase(
          folderRepository: locator.get<FolderRepository>()),
    );

    locator.registerLazySingleton<ToggleFolderPrivacyUseCase>(
      () => ToggleFolderPrivacyUseCase(
          folderRepository: locator.get<FolderRepository>()),
    );
  }
}
