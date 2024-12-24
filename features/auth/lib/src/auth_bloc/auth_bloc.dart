import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppRouter _appRouter;
  final BiometricService _biometricService;
  final SignUpWithCredentialsUseCase _signUpWithCredentialsUseCase;
  final SignInWithCredentialsUseCase _authoriseWithCredentialsUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final AppEventNotifier _appEventNotifier;

  AuthBloc({
    required AppRouter appRouter,
    required BiometricService biometricService,
    required SignUpWithCredentialsUseCase signUpWithCredentialsUseCase,
    required SignInWithCredentialsUseCase signInWithCredentialsUseCase,
    required SignOutUseCase signOutUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required AppEventNotifier appEventNotifier,
  })  : _signUpWithCredentialsUseCase = signUpWithCredentialsUseCase,
        _authoriseWithCredentialsUseCase = signInWithCredentialsUseCase,
        _signOutUseCase = signOutUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _appRouter = appRouter,
        _biometricService = biometricService,
        _appEventNotifier = appEventNotifier,
        super(const AuthState.initial()) {
    on<SignUpWithCredentials>(_onSignUpWithCredentials);
    on<SignInWithCredentials>(_onSignInWithCredentials);
    on<NavigateToLogin>(_onNavigateToLogin);
    on<NavigateToSignUp>(_onNavigateToSignUp);
    on<InitBloc>(_onInitBloc);
    on<SignOut>(_onSignOut);

    add(InitBloc());
  }

  Future<void> _onSignUpWithCredentials(
    SignUpWithCredentials event,
    Emitter<AuthState> emit,
  ) async {
    final String? errorMessage = _isCredentialsValid(
      login: event.login,
      password: event.password,
    );
    if (errorMessage != null) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: errorMessage,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? createdUser =
          await _signUpWithCredentialsUseCase.execute(
        SignUpPayloadModel(
          login: event.login,
          password: event.password,
        ),
      );

      if (createdUser != null) {
        debugPrint('User signed up event occurred!');
        await _appRouter.replace(const HomeRoute());
      }
    } on Exception catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSignInWithCredentials(
    SignInWithCredentials event,
    Emitter<AuthState> emit,
  ) async {
    final String? errorMessage = _isCredentialsValid(
      login: event.login,
      password: event.password,
    );
    if (errorMessage != null) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: errorMessage,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? userModel =
          await _authoriseWithCredentialsUseCase.execute(
        SignInPayloadModel(
          login: event.login,
          password: event.password,
        ),
      );

      if (userModel != null) {
        debugPrint('User logged in event occurred!');
        await _appRouter.replace(const HomeRoute());
      }
    } on Exception catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase.execute(const NoParams());

    emit(state.copyWith());
  }

  Future<void> _onInitBloc(
    InitBloc event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final UserModel? currentUser =
          _getCurrentUserUseCase.execute(const NoParams());

      if (currentUser == null) {
        return;
      }

      // final bool isBiometricsVerified =
      //     await _biometricService.authenticateWithBiometrics();
      //
      // if (!isBiometricsVerified) {
      //   await _signOutUseCase.execute(const NoParams());
      //   return;
      // }

      await _appRouter.replace(const HomeRoute());
    } on Exception catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _onNavigateToLogin(
    NavigateToLogin event,
    Emitter<AuthState> emit,
  ) =>
      _appRouter.replace(const LoginRoute());

  Future<void> _onNavigateToSignUp(
    NavigateToSignUp event,
    Emitter<AuthState> emit,
  ) =>
      _appRouter.replace(const SignUpRoute());

  String? _isCredentialsValid({
    required String login,
    required String password,
  }) {
    if (!_isLoginValid(login)) {
      // Todo Mikalai Sihau - add email validation error message
      return 'Invalid email';
    }

    if (!_isPasswordValid(password)) {
      // Todo Mikalai Sihau - add password validation error message
      return 'Invalid password';
    }

    return null;
  }

  bool _isLoginValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.length < 8 || password.length > 20) return false;
    return true;
  }
}
