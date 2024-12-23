part of 'user_folders_bloc.dart';

@immutable
class UserFoldersState {
  final bool isLoading;
  final List<FolderModel> folders;

  const UserFoldersState({
    required this.isLoading,
    required this.folders,
  });

  factory UserFoldersState.initial() {
    return const UserFoldersState(
      isLoading: false,
      folders: <FolderModel>[],
    );
  }

  UserFoldersState copyWith({
    bool? isLoading,
    List<FolderModel>? folders,
  }) {
    return UserFoldersState(
      isLoading: isLoading ?? this.isLoading,
      folders: folders ?? this.folders,
    );
  }
}
