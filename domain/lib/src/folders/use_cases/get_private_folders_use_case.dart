import '../../../domain.dart';

class GetPrivateFoldersUseCase
    extends FutureUseCase<GetPrivateFoldersPayload, List<FolderModel>> {
  final FolderRepository _folderRepository;

  GetPrivateFoldersUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<List<FolderModel>> execute(GetPrivateFoldersPayload input) async {
    return _folderRepository.getPrivateFolders(
      payload: input,
    );
  }
}
