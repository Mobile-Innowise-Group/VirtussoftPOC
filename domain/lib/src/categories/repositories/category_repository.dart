import '../../../domain.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesPayload payload,
  });

  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  });

  Future<CategoryModel> editCategory({
    required EditCategoryPayload payload,
  });

  Future<bool> deleteCategory({
    required DeleteCategoryPayload payload,
  });
}
