import 'package:domain/domain.dart';

import '../../providers/providers.dart';
import '../categories.dart';

class CategoryLocalProviderImpl implements CategoryLocalProvider {
  final DatabaseProvider _databaseProvider;

  CategoryLocalProviderImpl({
    required DatabaseProvider databaseProvider,
  }) : _databaseProvider = databaseProvider;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryLocalRequest request,
  }) async {
    final int row = await _databaseProvider.createCategory(request.toJson());
    return _getCategoryByRow(row: row);
  }

  @override
  Future<void> deleteCategory({
    required DeleteCategoryRequest request,
  }) async {
    await _databaseProvider.deleteCategory(request.categoryId);
  }

  @override
  Future<List<CategoryModel>> getCategories({
    required GetCategoriesRequest request,
  }) async {
    final List<Map<String, dynamic>> categories =
        await _databaseProvider.getCategories();
    return categories.map((Map<String, dynamic> category) {
      return CategoryMapper.toModel(CategoryEntity.fromJson(category));
    }).toList();
  }

  Future<CategoryModel> _getCategoryByRow({
    required int row,
  }) async {
    final List<Map<String, dynamic>> categories =
        await _databaseProvider.getCategoriesWithOffset(offset: row - 1);
    return CategoryMapper.toModel(CategoryEntity.fromJson(categories.first));
  }

  @override
  Future<CategoryModel> getCategoryById(
      {required GetUserCategoryByIdRequest request}) async {
    final List<Map<String, dynamic>> categories =
        await _databaseProvider.getCategoryById(request.categoryId);

    return CategoryMapper.toModel(CategoryEntity.fromJson(categories.first));
  }
}
