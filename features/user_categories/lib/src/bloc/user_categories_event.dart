part of 'user_categories_bloc.dart';

@immutable
sealed class UserCategoriesEvent {
  const UserCategoriesEvent();
}

class InitEvent extends UserCategoriesEvent {
  const InitEvent();
}

class CreateCategoryEvent extends UserCategoriesEvent {
  const CreateCategoryEvent();
}
