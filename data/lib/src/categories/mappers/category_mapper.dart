import 'package:domain/domain.dart';

import '../categories.dart';

abstract class CategoryMapper {
  static CategoryModel toModel(CategoryEntity categoryEntity) {
    return CategoryModel(
      id: categoryEntity.id,
      name: categoryEntity.name,
    );
  }

  static CategoryEntity toEntity(CategoryModel categoryModel) {
    return CategoryEntity(
      id: categoryModel.id,
      name: categoryModel.name,
    );
  }
}
