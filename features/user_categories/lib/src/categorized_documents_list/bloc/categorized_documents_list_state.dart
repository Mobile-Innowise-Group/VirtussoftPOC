part of 'categorized_documents_list_bloc.dart';

@immutable
class CategorizedDocumentsListState {
  final bool isLoading;
  final List<ScanEntryModel> allScanEntries;
  final CategoryModel? category;
  final bool isPrivateShown;
  final List<ScanEntryModel> shownScanEntries;

  const CategorizedDocumentsListState({
    required this.isLoading,
    required this.allScanEntries,
    required this.isPrivateShown,
    required this.shownScanEntries,
    this.category,
  });

  factory CategorizedDocumentsListState.initial() {
    return const CategorizedDocumentsListState(
      isLoading: false,
      isPrivateShown: false,
      allScanEntries: <ScanEntryModel>[],
      shownScanEntries: <ScanEntryModel>[],
    );
  }

  CategorizedDocumentsListState copyWith({
    bool? isLoading,
    bool? isPrivateShown,
    List<ScanEntryModel>? allScanEntries,
    List<ScanEntryModel>? shownScanEntries,
    CategoryModel? category,
  }) {
    return CategorizedDocumentsListState(
      isLoading: isLoading ?? this.isLoading,
      isPrivateShown: isPrivateShown ?? this.isPrivateShown,
      allScanEntries: allScanEntries ?? this.allScanEntries,
      shownScanEntries: shownScanEntries ?? this.shownScanEntries,
      category: category ?? this.category,
    );
  }
}
