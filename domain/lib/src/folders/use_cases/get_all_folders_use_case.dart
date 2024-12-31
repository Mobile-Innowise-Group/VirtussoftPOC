import '../../../domain.dart';

class GetAllFoldersUseCase
    extends FutureUseCase<GetAllFoldersPayload, List<FolderModel>> {
  final FolderRepository _folderRepository;

  GetAllFoldersUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<List<FolderModel>> execute(GetAllFoldersPayload input) async {
    return _folderRepository.getAllFolders(
      payload: input,
    );
  }
}
