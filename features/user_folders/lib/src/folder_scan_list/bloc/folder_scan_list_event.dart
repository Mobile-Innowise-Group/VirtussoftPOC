part of 'folder_scan_list_bloc.dart';

@immutable
sealed class FolderScanListEvent {
  const FolderScanListEvent();
}

class InitEvent extends FolderScanListEvent {
  const InitEvent();
}

class ShareQrEvent extends FolderScanListEvent {
  final Uint8List qrCodeBites;

  const ShareQrEvent({
    required this.qrCodeBites,
  });
}

class ShareFileEvent extends FolderScanListEvent {
  final ScanEntryModel scan;

  const ShareFileEvent({
    required this.scan,
  });
}

class CloseShareQrDialogEvent extends FolderScanListEvent {
  const CloseShareQrDialogEvent();
}
