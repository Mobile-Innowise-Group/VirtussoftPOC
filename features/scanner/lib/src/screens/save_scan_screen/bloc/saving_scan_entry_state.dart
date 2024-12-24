part of 'saving_scan_entry_bloc.dart';

class SavingScanEntryState {
  final bool isLoading;
  final List<FolderModel> folders;
  final List<CategoryModel> categories;
  final FolderModel? selectedFolder;
  final String? selectedFolderFieldError;
  final CategoryModel? selectedCategory;
  final String? selectedCategoryFieldError;

  const SavingScanEntryState({
    this.isLoading = true,
    this.folders = const <FolderModel>[],
    this.categories = const <CategoryModel>[],
    this.selectedFolder,
    this.selectedFolderFieldError,
    this.selectedCategory,
    this.selectedCategoryFieldError,
  });

  const SavingScanEntryState.initial({
    this.isLoading = true,
    this.folders = const <FolderModel>[],
    this.categories = const <CategoryModel>[],
    this.selectedFolder,
    this.selectedFolderFieldError,
    this.selectedCategory,
    this.selectedCategoryFieldError,
  });

  SavingScanEntryState copyWith({
    bool? isLoading,
    List<FolderModel>? folders,
    List<CategoryModel>? categories,
    FolderModel? selectedFolder,
    String? selectedFolderFieldError,
    CategoryModel? selectedCategory,
    String? selectedCategoryFieldError,
  }) {
    return SavingScanEntryState(
      isLoading: isLoading ?? this.isLoading,
      folders: folders ?? this.folders,
      categories: categories ?? this.categories,
      selectedFolder: selectedFolder ?? this.selectedFolder,
      selectedFolderFieldError: selectedFolderFieldError,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCategoryFieldError: selectedCategoryFieldError,
    );
  }
}
