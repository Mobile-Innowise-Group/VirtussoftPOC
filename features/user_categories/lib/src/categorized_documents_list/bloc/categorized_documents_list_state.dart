part of 'categorized_documents_list_bloc.dart';

@immutable
class CategorizedDocumentsListState {
  final bool isLoading;
  final List<ScanEntryModel> scanEntries;

  const CategorizedDocumentsListState({
    required this.isLoading,
    required this.scanEntries,
  });

  factory CategorizedDocumentsListState.initial() {
    return const CategorizedDocumentsListState(
      isLoading: false,
      scanEntries: <ScanEntryModel>[],
    );
  }

  CategorizedDocumentsListState copyWith({
    bool? isLoading,
    List<ScanEntryModel>? scanEntries,
  }) {
    return CategorizedDocumentsListState(
      isLoading: isLoading ?? this.isLoading,
      scanEntries: scanEntries ?? this.scanEntries,
    );
  }
}
