part of 'folder_scan_list_bloc.dart';

@immutable
sealed class FolderScanListEvent {
  const FolderScanListEvent();
}

class InitEvent extends FolderScanListEvent {
  const InitEvent();
}

class ShareScanEvent extends FolderScanListEvent {
  const ShareScanEvent();
}
