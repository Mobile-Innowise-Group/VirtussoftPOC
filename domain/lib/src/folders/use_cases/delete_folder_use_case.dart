import '../../../domain.dart';

class DeleteFolderUseCase extends FutureUseCase<DeleteFolderPayload, bool> {
  final FolderRepository _folderRepository;

  DeleteFolderUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<bool> execute(DeleteFolderPayload input) async {
    return _folderRepository.deleteFolder(
      payload: input,
    );
  }
}
