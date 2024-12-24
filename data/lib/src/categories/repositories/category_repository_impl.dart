import 'package:domain/domain.dart';
import '../categories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalProvider _categoryLocalProvider;
  final CategoryRemoteProvider _categoryRemoteProvider;

  CategoryRepositoryImpl({
    required CategoryLocalProvider categoryLocalProvider,
    required CategoryRemoteProvider categoryRemoteProvider,
  })  : _categoryRemoteProvider = categoryRemoteProvider,
        _categoryLocalProvider = categoryLocalProvider;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  }) async {
    final int createdCategoryId = await _categoryLocalProvider.createCategory(
      request: CreateCategoryLocalRequest(
        name: payload.name,
      ),
    );

    final CategoryModel createdRemoteCategory =
        await _categoryRemoteProvider.createCategory(
      request: CreateCategoryRemoteRequest(
        name: payload.name,
        id: createdCategoryId,
      ),
    );

    return createdRemoteCategory;
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryPayload payload,
  }) {
    return _categoryRemoteProvider.deleteCategory(
      request: DeleteCategoryRequest(
        categoryId: payload.category.id,
      ),
    );
  }

  @override
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesPayload payload,
  }) {
    return _categoryLocalProvider.getCategories(
        request: GetCategoriesRequest());
  }
}
