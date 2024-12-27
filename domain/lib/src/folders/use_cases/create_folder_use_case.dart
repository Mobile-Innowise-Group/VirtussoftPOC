import '../../../domain.dart';

class CreateFolderUseCase
    extends FutureUseCase<CreateFolderPayload, FolderModel> {
  final FolderRepository _folderRepository;

  CreateFolderUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<FolderModel> execute(CreateFolderPayload input) async {
    return _folderRepository.createFolder(
      payload: input,
    );
  }
}
