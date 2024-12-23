import '../../../domain.dart';

class GetUserCategoriesUseCase
    extends FutureUseCase<GetUserCategoriesPayload, List<CategoryModel>> {
  final CategoryRepository _categoryRepository;

  GetUserCategoriesUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<List<CategoryModel>> execute(GetUserCategoriesPayload input) async {
    return _categoryRepository.getUserCategories(
      payload: input,
    );
  }
}
