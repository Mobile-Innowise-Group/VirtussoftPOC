import '../../../domain.dart';

class GetScanEntriesUseCase
    extends FutureUseCase<GetScanEntriesPayload, List<ScanEntryModel>> {
  final ScanEntriesRepository _scanEntriesRepository;

  GetScanEntriesUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<List<ScanEntryModel>> execute(GetScanEntriesPayload input) async {
    return _scanEntriesRepository.getScanEntries(
      payload: input,
    );
  }
}
