import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesRequest request,
  });
}