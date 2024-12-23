part of 'auth_bloc.dart';

class AuthState {
  final bool isLoading;

  const AuthState({
    required this.isLoading,
  });

  const AuthState.initial() : isLoading = false;

  AuthState copyWith({
    bool? isLoading,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
