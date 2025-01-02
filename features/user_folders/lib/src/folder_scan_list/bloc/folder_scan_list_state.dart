part of 'folder_scan_list_bloc.dart';

@immutable
class FolderScanListState {
  final bool isLoading;
  final List<ScanEntryModel> scans;

  const FolderScanListState({
    required this.isLoading,
    required this.scans,
  });

  factory FolderScanListState.initial() {
    return const FolderScanListState(
      isLoading: false,
      scans: <ScanEntryModel>[],
    );
  }

  FolderScanListState copyWith({
    bool? isLoading,
    List<ScanEntryModel>? scans,
  }) {
    return FolderScanListState(
      isLoading: isLoading ?? this.isLoading,
      scans: scans ?? this.scans,
      // qrCode: qrCode,
    );
  }
}
