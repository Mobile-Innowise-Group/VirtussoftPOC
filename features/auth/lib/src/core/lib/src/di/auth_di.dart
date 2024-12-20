import 'package:auth/src/data/lib/data.dart';
import 'package:auth/src/domain/lib/domain.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../enum/providers_instance.dart';
/*//TODO(): Remove this line if you don't use firebase
import '../firebase_options.dart';*/

final AuthDI authDI = AuthDI();

class AuthDI {
  /*//TODO(): Remove this method if you don't use firebase
  static Future<void> _initFirebaseAuth() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    appLocator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
  }*/

  static Future<void> _initSupabaseAuth({required GetIt locator}) async {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
    );

    locator.registerLazySingleton<SupabaseClient>(
      () => Supabase.instance.client,
    );
  }

  static void _initExceptionMappers({required GetIt locator}) {
    locator.registerLazySingleton<ExceptionsMapper>(
      () => DioExceptionMapper(),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsMapper>(
      () => FirebaseExceptionMapper(),
      instanceName: ProviderInstance.firebaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsMapper>(
      () => SupabaseExceptionMapper(),
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );
  }

  static void _initExceptionHandlers({required GetIt locator}) {
    locator.registerLazySingleton<ExceptionsHandler>(
      () => DioExceptionHandler(
        dioExceptionsMapper: locator.get<ExceptionsMapper>(
          instanceName: ProviderInstance.customProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsHandler>(
      () => FirebaseExceptionHandler(
        firebaseExceptionsMapper: locator.get<ExceptionsMapper>(
          instanceName: ProviderInstance.firebaseProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.firebaseProviderInstanceName.name,
    );

    locator.registerLazySingleton<ExceptionsHandler>(
      () => SupabaseExceptionHandler(
        supabaseExceptionsMapper: locator.get<ExceptionsMapper>(
          instanceName: ProviderInstance.supabaseProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );
  }

  static void _initProviders({required GetIt locator}) {
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
      ),
      instanceName: ProviderInstance.supabaseProviderInstanceName.name,
    );
  }

  static void _initRepositories({required GetIt locator, required ProviderInstance provider}) {
    locator.registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(
        authProvider: locator.get<AuthorizationProvider>(
          instanceName: provider.name,
        ),
      ),
    );
  }

  static void _initUseCases({required GetIt locator}) {
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

    locator.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignUpWithCredentialsUseCase>(
      () => SignUpWithCredentialsUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );
  }

  static void _initServices({required GetIt locator}) {
    locator.registerLazySingleton<Dio>(
      () => Dio(),
    );
    locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );
  }

  static Future<void> initDependencies({
    required GetIt locator,
    required ProviderInstance provider,
  }) async {
    _initServices(locator: locator);

    await _initSupabaseAuth(locator: locator);
    //await _initFirebaseAuth();

    _initExceptionMappers(locator: locator);
    _initExceptionHandlers(locator: locator);

    _initProviders(locator: locator);
    _initRepositories(
      locator: locator,
      provider: provider,
    );

    _initUseCases(locator: locator);
  }
}
