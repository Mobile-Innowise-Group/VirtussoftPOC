part of 'categorized_documents_list_bloc.dart';

@immutable
sealed class CategorizedDocumentsListEvent {
  const CategorizedDocumentsListEvent();
}

class InitEvent extends CategorizedDocumentsListEvent {
  const InitEvent();
}

class OpenScanEvent extends CategorizedDocumentsListEvent {
  final String localUrl;

  const OpenScanEvent({required this.localUrl});
}

class ShareQrEvent extends CategorizedDocumentsListEvent {
  final Uint8List qrCodeBites;

  const ShareQrEvent({
    required this.qrCodeBites,
  });
}

class CloseShareQrDialogEvent extends CategorizedDocumentsListEvent {
  const CloseShareQrDialogEvent();
}

class ShareFileEvent extends CategorizedDocumentsListEvent {
  final ScanEntryModel scan;

  const ShareFileEvent({
    required this.scan,
  });
}
