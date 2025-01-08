part of 'user_folder_bloc.dart';

@immutable
class UserFolderState {
  final FolderModel folder;
  final int numberFiles;

  const UserFolderState({
    required this.folder,
    required this.numberFiles,
  });

  factory UserFolderState.initial(FolderModel folder) {
    return UserFolderState(numberFiles: 0, folder: folder);
  }

  UserFolderState copyWith({
    int? numberFiles,
    FolderModel? folder,
  }) {
    return UserFolderState(
      numberFiles: numberFiles ?? this.numberFiles,
      folder: folder ?? this.folder,
    );
  }
}
