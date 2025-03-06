part of 'scanner_bloc.dart';

class ScannerState {
  final bool isProcessing;

  const ScannerState({
    required this.isProcessing,
  });

  const ScannerState.initial() : isProcessing = false;

  ScannerState copyWith({
    bool? isProcessing,
  }) {
    return ScannerState(
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}
