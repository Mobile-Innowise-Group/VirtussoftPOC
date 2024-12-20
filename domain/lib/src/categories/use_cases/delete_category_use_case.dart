import '../../../domain.dart';

class DeleteCategoryUseCase extends FutureUseCase<DeleteCategoryPayload, bool> {
  final CategoryRepository _categoryRepository;

  DeleteCategoryUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<bool> execute(DeleteCategoryPayload input) async {
    return _categoryRepository.deleteCategory(
      payload: input,
    );
  }
}
