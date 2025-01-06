part of 'categorized_documents_list_bloc.dart';

@immutable
class CategorizedDocumentsListState {
  final bool isLoading;
  final List<ScanEntryModel> scanEntries;
  final CategoryModel? category;

  const CategorizedDocumentsListState({
    required this.isLoading,
    required this.scanEntries,
    this.category,
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
    CategoryModel? category,
  }) {
    return CategorizedDocumentsListState(
      isLoading: isLoading ?? this.isLoading,
      scanEntries: scanEntries ?? this.scanEntries,
      category: category ?? this.category,
    );
  }
}
