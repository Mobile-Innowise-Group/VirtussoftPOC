part of 'user_folders_bloc.dart';

@immutable
sealed class UserFoldersEvent {
  const UserFoldersEvent();
}

class InitEvent extends UserFoldersEvent {
  const InitEvent();
}

class CreateFolderEvent extends UserFoldersEvent {
  final String folderName;

  const CreateFolderEvent({
    required this.folderName,
  });
}

class DeleteFolderEvent extends UserFoldersEvent {
  final FolderModel folder;

  const DeleteFolderEvent(this.folder);
}

class ToggleExpandedEvent extends UserFoldersEvent {
  const ToggleExpandedEvent();
}

class ToggleFolderPrivacyEvent extends UserFoldersEvent {
  final FolderModel folder;

  const ToggleFolderPrivacyEvent(this.folder);
}

class OpenFolderEvent extends UserFoldersEvent {
  final FolderModel folder;

  const OpenFolderEvent({
    required this.folder,
  });
}
