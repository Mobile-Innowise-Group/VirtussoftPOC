import '../../../domain.dart';

class GetAllUserScanEntriesUseCase
    extends FutureUseCase<GetScanEntriesPayload, List<ScanEntryModel>> {
  final ScanEntriesRepository _scanEntriesRepository;

  GetAllUserScanEntriesUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<List<ScanEntryModel>> execute(GetScanEntriesPayload input) async {
    return _scanEntriesRepository.getAllUserScanEntries(
      payload: input,
    );
  }
}
