import 'package:domain/domain.dart';

import '../../providers/providers.dart';
import '../categories.dart';

class CategoryLocalProviderImpl implements CategoryLocalProvider {
  final DatabaseProvider _databaseProvider;

  CategoryLocalProviderImpl({
    required DatabaseProvider databaseProvider,
  }) : _databaseProvider = databaseProvider;

  @override
  Future<int> createCategory({
    required CreateCategoryLocalRequest request,
  }) {
    return _databaseProvider.createCategory(request.toJson());
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
}
