part of 'scanner_bloc.dart';

abstract class ScannerEvent {
  const ScannerEvent();
}

class OpenScanner extends ScannerEvent {
  const OpenScanner();
}
