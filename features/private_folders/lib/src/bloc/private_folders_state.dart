part of 'private_folders_bloc.dart';

@immutable
class PrivateFoldersState {
  final bool isLoading;
  final bool isAuthenticated;
  final bool didTryToAuthenticate;
  final List<FolderModel> folders;

  const PrivateFoldersState({
    required this.isLoading,
    required this.isAuthenticated,
    required this.didTryToAuthenticate,
    required this.folders,
  });

  factory PrivateFoldersState.initial() {
    return const PrivateFoldersState(
      isLoading: false,
      isAuthenticated: false,
      didTryToAuthenticate: false,
      folders: <FolderModel>[],
    );
  }

  PrivateFoldersState copyWith({
    bool? isLoading,
    List<FolderModel>? folders,
    bool? isAuthenticated,
    bool? didTryToAuthenticate,
  }) {
    return PrivateFoldersState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      folders: folders ?? this.folders,
      didTryToAuthenticate: didTryToAuthenticate ?? this.didTryToAuthenticate,
    );
  }
}
