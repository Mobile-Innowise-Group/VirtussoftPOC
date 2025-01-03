part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpWithCredentials extends AuthEvent {
  final String login;
  final String password;
  final String username;

  SignUpWithCredentials({
    required this.login,
    required this.password,
    required this.username,
  });
}

class SignInWithSessionId extends AuthEvent {}

class SignInWithCredentials extends AuthEvent {
  final String login;
  final String password;

  SignInWithCredentials({
    required this.login,
    required this.password,
  });
}

class InitBloc extends AuthEvent {}

class NavigateToLogin extends AuthEvent {}

class NavigateToSignUp extends AuthEvent {}
