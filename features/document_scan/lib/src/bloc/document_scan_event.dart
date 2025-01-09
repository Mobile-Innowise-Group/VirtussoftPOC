part of 'document_scan_bloc.dart';

@immutable
sealed class DocumentScanEvent {
  const DocumentScanEvent();
}

class DownloadFileEvent extends DocumentScanEvent {
  final String localPath;
  final String remotePath;

  const DownloadFileEvent({
    required this.localPath,
    required this.remotePath,
  });
}

class InitEvent extends DocumentScanEvent {
  const InitEvent();
}

class OpenScanEvent extends DocumentScanEvent {
  final ScanEntryModel scan;

  const OpenScanEvent({
    required this.scan,
  });
}
