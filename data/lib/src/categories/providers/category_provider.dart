import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryProvider {
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesRequest request,
  });

  Future<CategoryModel> getUserCategoryById({
    required GetUserCategoryByIdRequest request,
  });

  Future<CategoryModel> createCategory({
    required CreateCategoryRequest request,
  });

  Future<bool> deleteCategory({
    required DeleteCategoryRequest request,
  });
}
