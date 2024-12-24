import '../../../domain.dart';

class CreateCategoryUseCase
    extends FutureUseCase<CreateCategoryPayload, CategoryModel> {
  final CategoryRepository _categoryRepository;

  CreateCategoryUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<CategoryModel> execute(CreateCategoryPayload input) async {
    return _categoryRepository.createCategory(
      payload: input,
    );
  }
}
