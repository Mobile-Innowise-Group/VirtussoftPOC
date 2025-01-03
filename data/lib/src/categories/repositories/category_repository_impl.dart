import 'package:domain/domain.dart';
import 'package:uuid/uuid.dart';
import '../../auth/auth.dart';
import '../../auth/entities/entities.dart';
import '../categories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalProvider _categoryLocalProvider;
  final CategoryRemoteProvider _categoryRemoteProvider;
  final AuthorizationProvider _authorizationProvider;
  final Uuid _uuid;

  CategoryRepositoryImpl({
    required CategoryLocalProvider categoryLocalProvider,
    required CategoryRemoteProvider categoryRemoteProvider,
    required AuthorizationProvider authorizationProvider,
    required Uuid uuid,
  })  : _categoryRemoteProvider = categoryRemoteProvider,
        _categoryLocalProvider = categoryLocalProvider,
        _uuid = uuid,
        _authorizationProvider = authorizationProvider;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryPayload payload,
  }) async {
    final UserEntity? userEntity = _authorizationProvider.getCurrentUser();

    if (userEntity == null) {
      // TODO(Karatysh): logout instead
      throw const AppException('no current user');
    }

    final CategoryModel category = await _categoryLocalProvider.createCategory(
      request: CreateCategoryLocalRequest(
        name: payload.name,
        id: _uuid.v4(),
      ),
    );

    try {
      final CategoryModel createdRemoteCategory =
          await _categoryRemoteProvider.createCategory(
        request: CreateCategoryRemoteRequest(
            name: category.name, id: category.id, userId: userEntity.id),
      );

      return createdRemoteCategory;
    } catch (e) {
      throw FailedToCreateRemoteCategoryException(e.toString());
    }
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
