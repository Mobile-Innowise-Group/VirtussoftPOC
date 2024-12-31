import '../../../domain.dart';

class GetScanEntriesByFolderUseCase extends FutureUseCase<GetScanEntriesByFolderIdPayload, List<ScanEntryModel>> {
  final ScanEntriesRepository _scanEntriesRepository;

  GetScanEntriesByFolderUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<List<ScanEntryModel>> execute(GetScanEntriesByFolderIdPayload input) async {
    return _scanEntriesRepository.getScanEntriesByFolderId(
      payload: input,
    );
  }
}
