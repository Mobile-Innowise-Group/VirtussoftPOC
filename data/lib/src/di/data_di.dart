import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../data.dart';
import '../auth/auth.dart';
import '../auth/exceptions/handlers/handlers.dart';
import '../auth/exceptions/mappers/mappers.dart';
import '../categories/categories.dart';
import '../folders/folders.dart';
import '../scan_entries/providers/scan_entries_provider.dart';
import '../scan_entries/providers/scan_entries_provider_impl.dart';
import '../scan_entries/repositories/scan_antries_repository_impl.dart';
import '../synchronization/synchronization.dart';

abstract class DataDI {
  static void initDependencies({
    required GetIt locator,
    required ProviderInstance provider,
  }) {
    _initSupabaseAuth(locator);
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator: locator, provider: provider);
    _initExceptionMappers(locator);
    _initExceptionHandlers(locator);
    _initServices(locator);
  }

  /*//TODO(): Remove this method if you don't use firebase
  static Future<void> _initFirebaseAuth() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    appLocator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
  }*/

  static Future<void> _initSupabaseAuth(GetIt locator) async {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
    );

    locator.registerLazySingleton<SupabaseClient>(
      () => Supabase.instance.client,
    );
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
    locator.registerLazySingleton<CategoryRemoteProvider>(
      () => CategoryRemoteProviderImpl(
        supabaseClient: locator<SupabaseClient>(),
        supabaseExceptionHandler: locator.get<ExceptionsHandler>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
      ),
    );

    locator.registerLazySingleton<AuthorizationProvider>(
      () => CustomAuthProviderImpl(
        dio: locator.get<Dio>(),
        storage: locator.get<FlutterSecureStorage>(),
        customExceptionHandler: locator.get<ExceptionsHandler>(
            instanceName: ProviderInstance.customProviderInstanceName.name),
      ),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

    locator.registerLazySingleton<AuthorizationProvider>(
      () => FirebaseAuthProvider(
        firebaseAuth: locator.get<FirebaseAuth>(),
        firebaseExceptionsHandler: locator.get<ExceptionsHandler>(
            instanceName: ProviderInstance.firebaseProviderInstanceName.name),
      ),
      instanceName: ProviderInstance.firebaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<AuthorizationProvider>(
      () => SupabaseAuthProvider(
        supabaseClient: locator.get<SupabaseClient>(),
        supabaseExceptionHandler: locator.get<ExceptionsHandler>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
        tokenProvider: locator.get<TokenProvider>(),
      ),
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<TokenProvider>(
      () => TokenProviderImpl(
        storage: locator.get<FlutterSecureStorage>(),
      ),
    );

    locator.registerLazySingleton<UserSessionProvider>(
      () => UserSessionProviderImpl(
        storage: locator.get<FlutterSecureStorage>(),
      ),
    );

    locator.registerLazySingleton<FolderRemoteProvider>(
      () => FolderRemoteProviderImpl(
        supabaseClient: locator.get<SupabaseClient>(),
        supabaseExceptionHandler: locator.get<ExceptionsHandler>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
      ),
    );

    locator.registerLazySingleton<FolderLocalProvider>(
      () => FolderLocalProviderImpl(
        databaseProvider: locator.get<DatabaseProvider>(),
      ),
    );

    locator.registerLazySingleton<CategoryLocalProvider>(
      () => CategoryLocalProviderImpl(
        databaseProvider: locator.get<DatabaseProvider>(),
      ),
    );

    locator.registerLazySingleton<DatabaseProvider>(
      DatabaseProvider.new,
    );

    locator.registerLazySingleton<SynchronizationProvider>(
      SynchronizationProviderImpl.new,
    );

    locator.registerLazySingleton<ScanEntriesProvider>(
      () => ScanEntriesProviderImpl(
        supabaseClient: locator.get<SupabaseClient>(),
        supabaseExceptionHandler: locator.get<ExceptionsHandler>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
      ),
    );
  }

  static void _initRepositories({
    required GetIt locator,
    required ProviderInstance provider,
  }) {
    locator.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(
        categoryRemoteProvider: locator<CategoryRemoteProvider>(),
        categoryLocalProvider: locator<CategoryLocalProvider>(),
        uuid: locator<Uuid>(),
        authorizationProvider: locator.get<AuthorizationProvider>(
          instanceName: provider.name,
        ),
      ),
    );

    locator.registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(
        authProvider: locator.get<AuthorizationProvider>(
          instanceName: provider.name,
        ),
      ),
    );

    locator.registerLazySingleton<FolderRepository>(
      () => FolderRepositoryImpl(
        folderRemoteProvider: locator<FolderRemoteProvider>(),
        folderLocalProvider: locator<FolderLocalProvider>(),
        uuid: locator<Uuid>(),
        authorizationProvider: locator.get<AuthorizationProvider>(
          instanceName: provider.name,
        ),
      ),
    );

    locator.registerLazySingleton<SynchronizationRepository>(
      () => SynchronizationRepositoryImpl(
        synchronizationProvider: locator<SynchronizationProvider>(),
        categoryRemoteProvider: locator<CategoryRemoteProvider>(),
        folderRemoteProvider: locator<FolderRemoteProvider>(),
        categoryLocalProvider: locator<CategoryLocalProvider>(),
        folderLocalProvider: locator<FolderLocalProvider>(),
      ),
    );

    locator.registerLazySingleton<ScanEntriesRepository>(
      () => ScanEntriesRepositoryImpl(
        scanEntriesProvider: locator<ScanEntriesProvider>(),
        folderProvider: locator<FolderRemoteProvider>(),
        authorizationProvider: locator<AuthorizationProvider>(
          instanceName: provider.name,
        ),
        categoryLocalProvider: locator<CategoryLocalProvider>(),
      ),
    );
  }

  static void _initExceptionMappers(GetIt locator) {
    locator.registerLazySingleton<ExceptionsMapper<Exception>>(
      DioExceptionMapper.new,
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsMapper<Exception>>(
      FirebaseExceptionMapper.new,
      instanceName: ProviderInstance.firebaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsMapper<Exception>>(
      SupabaseExceptionMapper.new,
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );
  }

  static void _initExceptionHandlers(GetIt locator) {
    locator.registerLazySingleton<ExceptionsHandler>(
      () => DioExceptionHandler(
        dioExceptionsMapper: locator.get<ExceptionsMapper<Exception>>(
          instanceName: ProviderInstance.customProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsHandler>(
      () => FirebaseExceptionHandler(
        firebaseExceptionsMapper: locator.get<ExceptionsMapper<Exception>>(
          instanceName: ProviderInstance.firebaseProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.firebaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsHandler>(
      () => SupabaseExceptionHandler(
        supabaseExceptionsMapper: locator.get<ExceptionsMapper<Exception>>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );
  }

  static void _initServices(GetIt locator) {
    locator.registerLazySingleton<Dio>(
      Dio.new,
    );
    locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

    locator.registerLazySingleton<Uuid>(
      () => const Uuid(),
    );
  }
}
