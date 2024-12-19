import 'package:domain/domain.dart';

import '../categories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl({
    required CategoryRemoteDataSource categoryRemoteDataSource,
  }) : _categoryRemoteDataSource = categoryRemoteDataSource;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  }) {
    return _categoryRemoteDataSource.createCategory(
        request: CreateCategoryRequest());
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryPayload payload,
  }) {
    return _categoryRemoteDataSource.deleteCategory(
        request: DeleteCategoryRequest());
  }

  @override
  Future<CategoryModel> editCategory({
    required EditCategoryPayload payload,
  }) {
    return _categoryRemoteDataSource.editCategory(
        request: EditCategoryRequest());
  }

  @override
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesPayload payload,
  }) {
    return _categoryRemoteDataSource.getUserCategories(
        request: GetUserCategoriesRequest());
  }
}
