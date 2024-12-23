part of 'user_categories_bloc.dart';

@immutable
sealed class UserCategoriesEvent {
  const UserCategoriesEvent();
}

class InitEvent extends UserCategoriesEvent {
  const InitEvent();
}

class CreateCategoryEvent extends UserCategoriesEvent {
  final String categoryName;

  const CreateCategoryEvent({
    required this.categoryName,
  });
}

class DeleteCategoryEvent extends UserCategoriesEvent {
  final CategoryModel category;

  const DeleteCategoryEvent(this.category);
}

class ToggleExpandedEvent extends UserCategoriesEvent {
  const ToggleExpandedEvent();
}
