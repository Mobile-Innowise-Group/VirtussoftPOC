part of 'user_folder_bloc.dart';

@immutable
sealed class UserFolderEvent {
  const UserFolderEvent();
}

class InitEvent extends UserFolderEvent {
  const InitEvent();
}

class OpenFolderEvent extends UserFolderEvent {
  final FolderModel folder;

  const OpenFolderEvent({
    required this.folder,
  });
}
