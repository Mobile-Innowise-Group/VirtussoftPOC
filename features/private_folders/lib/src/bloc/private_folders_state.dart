part of 'private_folders_bloc.dart';

@immutable
class PrivateFoldersState {
  final bool isLoading;
  final List<FolderModel> folders;

  const PrivateFoldersState({
    required this.isLoading,
    required this.folders,
  });

  factory PrivateFoldersState.initial() {
    return const PrivateFoldersState(
      isLoading: false,
      folders: <FolderModel>[],
    );
  }

  PrivateFoldersState copyWith({
    bool? isLoading,
    List<FolderModel>? folders,
  }) {
    return PrivateFoldersState(
      isLoading: isLoading ?? this.isLoading,
      folders: folders ?? this.folders,
    );
  }
}
