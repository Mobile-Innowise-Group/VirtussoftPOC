part of 'auth_bloc.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    required this.isLoading,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return const AuthState(
      isLoading: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
