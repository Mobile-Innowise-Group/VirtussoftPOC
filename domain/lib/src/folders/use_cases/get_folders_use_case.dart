import '../../../domain.dart';

class GetFoldersUseCase
    extends FutureUseCase<GetFoldersPayload, List<FolderModel>> {
  final FolderRepository _folderRepository;

  GetFoldersUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<List<FolderModel>> execute(GetFoldersPayload input) async {
    return _folderRepository.getFolders(
      payload: input,
    );
  }
}
