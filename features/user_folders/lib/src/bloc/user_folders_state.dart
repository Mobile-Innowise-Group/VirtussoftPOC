part of 'user_folders_bloc.dart';

@immutable
class UserFoldersState {
  final bool isLoading;
  final bool isExpanded;
  final List<FolderModel> folders;

  const UserFoldersState({
    required this.isLoading,
    required this.isExpanded,
    required this.folders,
  });

  factory UserFoldersState.initial() {
    return const UserFoldersState(
      isLoading: false,
      isExpanded: false,
      folders: <FolderModel>[],
    );
  }

  UserFoldersState copyWith({
    bool? isLoading,
    bool? isExpanded,
    List<FolderModel>? folders,
  }) {
    return UserFoldersState(
      isLoading: isLoading ?? this.isLoading,
      isExpanded: isExpanded ?? this.isExpanded,
      folders: folders ?? this.folders,
    );
  }
}
