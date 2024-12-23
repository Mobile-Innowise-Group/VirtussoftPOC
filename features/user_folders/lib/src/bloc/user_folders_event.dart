part of 'user_folders_bloc.dart';

@immutable
abstract class UserFoldersEvent {
  const UserFoldersEvent();
}

class CreateFolderEvent extends UserFoldersEvent {
  final String folderName;

  const CreateFolderEvent({
    required this.folderName,
  });
}

class DeleteFolderEvent extends UserFoldersEvent {
  final FolderModel folder;

  const DeleteFolderEvent({
    required this.folder,
  });
}
