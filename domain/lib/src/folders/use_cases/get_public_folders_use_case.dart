import '../../../domain.dart';

class GetPublicFoldersUseCase
    extends FutureUseCase<GetPublicFoldersPayload, List<FolderModel>> {
  final FolderRepository _folderRepository;

  GetPublicFoldersUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<List<FolderModel>> execute(GetPublicFoldersPayload input) async {
    return _folderRepository.getPublicFolders(
      payload: input,
    );
  }
}
