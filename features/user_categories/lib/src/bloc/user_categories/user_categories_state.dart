part of 'user_categories_bloc.dart';

@immutable
class UserCategoriesState {
  final bool isLoading;
  final List<CategoryModel> categories;

  const UserCategoriesState({
    required this.isLoading,
    required this.categories,
  });

  factory UserCategoriesState.initial() {
    return const UserCategoriesState(
      isLoading: true,
      categories: <CategoryModel>[],
    );
  }

  UserCategoriesState copyWith({
    bool? isLoading,
    List<CategoryModel>? categories,
  }) {
    return UserCategoriesState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
