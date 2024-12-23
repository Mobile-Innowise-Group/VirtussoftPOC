part of 'user_folders_bloc.dart';

@immutable
class UserFoldersState {
  final bool isLoading;

  const UserFoldersState({
    required this.isLoading,
  });

  factory UserFoldersState.initial() {
    return const UserFoldersState(
      isLoading: false,
    );
  }

  UserFoldersState copyWith({
    bool? isLoading,
  }) {
    return UserFoldersState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
