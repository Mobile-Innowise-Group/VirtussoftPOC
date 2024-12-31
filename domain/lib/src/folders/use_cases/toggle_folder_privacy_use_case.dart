import '../../../domain.dart';

class ToggleFolderPrivacyUseCase
    extends FutureUseCase<ToggleFolderPrivacyPayload, FolderModel> {
  final FolderRepository _folderRepository;

  ToggleFolderPrivacyUseCase({
    required FolderRepository folderRepository,
  }) : _folderRepository = folderRepository;

  @override
  Future<FolderModel> execute(ToggleFolderPrivacyPayload input) async {
    return _folderRepository.toggleFolderPrivacy(
      payload: input,
    );
  }
}
