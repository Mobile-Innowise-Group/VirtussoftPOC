import '../../../domain.dart';

class CreatePrivateFolderUseCase
    extends FutureUseCase<CreateFolderPayload, FolderModel> {
  final FolderRepository _folderRepository;

  CreatePrivateFolderUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<FolderModel> execute(CreateFolderPayload input) async {
    return _folderRepository.createFolder(
      payload: input,
    );
  }
}
