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

class CloseShareQrDialogEvent extends FolderScanListEvent {
  const CloseShareQrDialogEvent();
}

class OpenScanEvent extends FolderScanListEvent {
  final String localUrl;

  const OpenScanEvent({
    required this.localUrl,
  });
}

