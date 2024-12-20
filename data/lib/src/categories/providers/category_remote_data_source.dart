import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesRequest request,
  });

  Future<CategoryModel> createCategory({
    required CreateCategoryRequest request,
  });

  Future<CategoryModel> editCategory({
    required  EditCategoryRequest request,
  });

  Future<bool> deleteCategory({
    required  DeleteCategoryRequest request,
  });
}