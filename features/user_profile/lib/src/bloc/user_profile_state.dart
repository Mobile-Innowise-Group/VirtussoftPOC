part of 'user_profile_bloc.dart';

@immutable
class UserProfileState {
  final bool isLoading;

  const UserProfileState({
    required this.isLoading,
  });

  factory UserProfileState.initial() {
    return const UserProfileState(
      isLoading: false,
    );
  }

  UserProfileState copyWith({
    bool? isLoading,
  }) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
