import 'package:domain/domain.dart';

import '../categories.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryRequest request,
  }) {
    return Future<CategoryModel>.value(CategoryModel(name: request.name));
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryRequest request,
  }) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<CategoryModel> editCategory({
    required EditCategoryRequest request,
  }) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesRequest request,
  }) {
    // TODO: implement getUserCategories
    throw UnimplementedError();
  }
}
