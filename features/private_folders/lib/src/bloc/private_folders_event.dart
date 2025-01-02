part of 'private_folders_bloc.dart';

@immutable
sealed class PrivateFoldersEvent {
  const PrivateFoldersEvent();
}

class InitEvent extends PrivateFoldersEvent {
  const InitEvent();
}

class CreatePrivateFolderEvent extends PrivateFoldersEvent {
  final String folderName;

  const CreatePrivateFolderEvent({
    required this.folderName,
  });
}

class ToggleFolderPrivacyEvent extends PrivateFoldersEvent {
  final FolderModel folder;

  const ToggleFolderPrivacyEvent(this.folder);
}
