import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../categories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;
  final CategoryLocalDataSource _categoryLocalDataSource;

  CategoryRepositoryImpl({
    required CategoryRemoteDataSource categoryRemoteDataSource,
    required CategoryLocalDataSource categoryLocalDataSource,
  })  : _categoryRemoteDataSource = categoryRemoteDataSource,
        _categoryLocalDataSource = categoryLocalDataSource;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  }) async {
    final CategoryModel createdCategory =
        await _categoryRemoteDataSource.createCategory(
      request: CreateCategoryRequest(
        name: payload.name,
      ),
    );
    final Directory directory = await getApplicationDocumentsDirectory();
    final String categoriesPath = '${directory.path}/categories';
    final Directory categoriesFolder = Directory(categoriesPath);

    if (!categoriesFolder.existsSync()) {
      await categoriesFolder.create();
    }

    final String categoryPath = '${directory.path}/categories/${payload.name}';
    final Directory folder = Directory(categoryPath);

    if (!folder.existsSync()) {
      await folder.create();
      AppLogger().info('Folder created at: $categoriesPath');
    } else {
      AppLogger().info('Folder already exists at: $categoriesPath');
    }

    return createdCategory;
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryPayload payload,
  }) async {
    final bool response = await _categoryRemoteDataSource.deleteCategory(
      request: DeleteCategoryRequest(
        categoryId: payload.category.id,
      ),
    );
    final Directory directory = await getApplicationDocumentsDirectory();
    final String categoryPath =
        '${directory.path}/categories/${payload.category.name}';
    final Directory folder = Directory(categoryPath);

    if (folder.existsSync()) {
      await folder.delete(recursive: true);
      AppLogger().info('Folder deleted at: $categoryPath');
    } else {
      AppLogger().info('Folder does not exist at: $categoryPath');
    }
    return response;
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
  }) async {
    // final List<CategoryModel> localCategories =
    //     await _categoryLocalDataSource.getUserCategories(
    //   request: GetUserCategoriesRequest(),
    // );
    // return localCategories;
    return _categoryRemoteDataSource.getUserCategories(
        request: GetUserCategoriesRequest());
  }
}
