part of 'document_scan_bloc.dart';

@immutable
class DocumentScanState {
  final FileStatus fileStatus;

  const DocumentScanState({
    required this.fileStatus,
  });

  factory DocumentScanState.initial() {
    return const DocumentScanState(
      fileStatus: FileStatus.empty,
    );
  }

  DocumentScanState copyWith({
    FileStatus? fileStatus,
  }) {
    return DocumentScanState(
      fileStatus: fileStatus ?? this.fileStatus,
    );
  }
}
