import 'dart:io';

import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../categories.dart';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  @override
  Future<List<CategoryModel>> getUserCategories({
    required GetUserCategoriesRequest request,
  }) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String specificDirPath = '${appDocDir.path}/categories';
    final Directory categoriesPath = Directory(specificDirPath);

    if (categoriesPath.existsSync()) {
      final List<FileSystemEntity> entities = categoriesPath.listSync();
      return entities
          .map((FileSystemEntity entity) => CategoryModel(
                name: entity.path.split('/').last,
              ))
          .toList();
    } else {
      return <CategoryModel>[];
    }
  }
}
