import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryRemoteProvider {
  Future<List<CategoryModel>> getUserCategories({
    required GetCategoriesRequest request,
  });

  Future<CategoryModel> createCategory({
    required CreateCategoryRemoteRequest request,
  });

  Future<bool> deleteCategory({
    required DeleteCategoryRequest request,
  });
}
