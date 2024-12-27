import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryLocalProvider {
  Future<int> createCategory({
    required CreateCategoryLocalRequest request,
  });

  Future<void> deleteCategory({
    required DeleteCategoryRequest request,
  });

  Future<List<CategoryModel>> getCategories({
    required GetCategoriesRequest request,
  });
}
