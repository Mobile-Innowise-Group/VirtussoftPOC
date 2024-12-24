part of 'doc_scanner_bloc.dart';

abstract class DocScannerEvent {
  const DocScannerEvent();
}

class OpenScanner extends DocScannerEvent {
  const OpenScanner();
}
