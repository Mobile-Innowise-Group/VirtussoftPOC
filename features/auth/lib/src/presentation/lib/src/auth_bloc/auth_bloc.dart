import 'package:auth/src/domain/lib/domain.dart';
import 'package:biometrics/biometrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppRouter _appRouter;
  final BiometricService _biometricService;
  final SignUpWithCredentialsUseCase _signUpWithCredentialsUseCase;
  final SignInWithCredentialsUseCase _authoriseWithCredentialsUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUsecase _getCurrentUserUseCase;

  AuthBloc({
    required AppRouter appRouter,
    required BiometricService biometricService,
    required SignUpWithCredentialsUseCase signUpWithCredentialsUseCase,
    required SignInWithCredentialsUseCase signInWithCredentialsUseCase,
    required SignOutUseCase signOutUseCase,
    required GetCurrentUserUsecase getCurrentUserUseCase,
  })  : _signUpWithCredentialsUseCase = signUpWithCredentialsUseCase,
        _authoriseWithCredentialsUseCase = signInWithCredentialsUseCase,
        _signOutUseCase = signOutUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _appRouter = appRouter,
        _biometricService = biometricService,
        super(const AuthState.initial()) {
    on<SignUpWithCredentials>(_onSignUpWithCredentials);
    on<SignInWithCredentials>(_onSignInWithCredentials);
    on<NavigateToLogin>(_onNavigateToLogin);
    on<NavigateToSignUp>(_onNavigateToSignUp);
    on<GetCurrentUser>(_onGetCurrentUser);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onSignUpWithCredentials(
    SignUpWithCredentials event,
    Emitter<AuthState> emit,
  ) async {
    if (!_isCredentialsValid(
      emit: emit,
      login: event.login,
      password: event.password,
    )) {
      // TODO():  Add unsupported formatting handling
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? createdUser = await _signUpWithCredentialsUseCase.execute(
        SignUpPayloadModel(
          login: event.login,
          password: event.password,
        ),
      );
      emit(state.copyWith(currentUser: createdUser));

      if (createdUser != null) {
        // TODO():  Add some conditional redirection on successfully signed up logic
        debugPrint('User signed up event occurred!');
        _appRouter.replace(const DemoHomeRoute());
      }
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSignInWithCredentials(
    SignInWithCredentials event,
    Emitter<AuthState> emit,
  ) async {
    if (!_isCredentialsValid(
      emit: emit,
      login: event.login,
      password: event.password,
    )) {
      // TODO():  Add unsupported formatting handling
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final UserModel? userModel = await _authoriseWithCredentialsUseCase.execute(
        SignInPayloadModel(
          login: event.login,
          password: event.password,
        ),
      );

      emit(state.copyWith(currentUser: userModel));

      if (userModel != null) {
        // TODO():  Add some conditional redirection on successfully logged in logic
        debugPrint('User logged in event occurred!');
        _appRouter.replace(const DemoHomeRoute());
      }
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase.execute(const NoParams());

    emit(state.copyWith(currentUser: null));
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final UserModel? currentUser = await _getCurrentUserUseCase.execute(const NoParams());

      if (currentUser == null) {
        return;
      }

      bool isBiometricsVerified = await _biometricService.authenticateWithBiometrics();

      if (!isBiometricsVerified) {
        await _signOutUseCase.execute(const NoParams());

        return;
      }

      emit(state.copyWith(currentUser: currentUser));
      _appRouter.replace(const DemoHomeRoute());
    } on Exception catch (e) {
      // TODO(): Add exception handling
      debugPrint(e.toString());
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

  bool _isCredentialsValid({
    required String login,
    required String password,
    required Emitter<AuthState> emit,
  }) {
    if (!_isLoginValid(login)) {
      emit(state.copyWith(isLoginInvalid: true));
      return false;
    }

    if (!_isPasswordValid(password)) {
      emit(state.copyWith(isPasswordInvalid: true));
      return false;
    }

    emit(
      state.copyWith(
        isLoginInvalid: false,
        isPasswordInvalid: false,
      ),
    );

    return true;
  }

  bool _isLoginValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.length < 8 || password.length > 20) return false;
    return true;
  }
}
