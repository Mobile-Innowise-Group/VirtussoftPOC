import '../../../domain.dart';

class EditCategoryUseCase
    extends FutureUseCase<EditCategoryPayload, CategoryModel> {
  final CategoryRepository _categoryRepository;

  EditCategoryUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<CategoryModel> execute(EditCategoryPayload input) async {
    return _categoryRepository.editCategory(
      payload: input,
    );
  }
}
