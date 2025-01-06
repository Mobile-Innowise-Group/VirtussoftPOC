part of 'user_categories_bloc.dart';

@immutable
class UserCategoriesState {
  final bool isLoading;
  final bool isExpanded;
  final List<CategoryModel> categories;

  const UserCategoriesState({
    required this.isLoading,
    required this.categories,
    required this.isExpanded,
  });

  factory UserCategoriesState.initial() {
    return const UserCategoriesState(
      isLoading: false,
      isExpanded: false,
      categories: <CategoryModel>[],
    );
  }

  UserCategoriesState copyWith({
    bool? isLoading,
    bool? isExpanded,
    List<CategoryModel>? categories,
  }) {
    return UserCategoriesState(
      isLoading: isLoading ?? this.isLoading,
      isExpanded: isExpanded ?? this.isExpanded,
      categories: categories ?? this.categories,
    );
  }
}
