import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../categories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryProvider _categoryProvider;

  CategoryRepositoryImpl({
    required CategoryProvider categoryProvider,
  }) : _categoryProvider = categoryProvider;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  }) {
    return _categoryProvider.createCategory(
      request: CreateCategoryRequest(
        name: payload.name,
      ),
    );
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryPayload payload,
  }) {
    return _categoryProvider.deleteCategory(
      request: DeleteCategoryRequest(
        categoryId: payload.category.id,
      ),
    );
  }

  @override
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesPayload payload,
  }) {
    return _categoryProvider.getUserCategories(
        request: GetUserCategoriesRequest());
  }
}
