import '../../../domain.dart';

class GetScanEntriesByCategoryUseCase extends FutureUseCase<
    GetScanEntriesByCategoryPayload, List<ScanEntryModel>> {
  final ScanEntriesRepository _scanEntriesRepository;

  GetScanEntriesByCategoryUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<List<ScanEntryModel>> execute(
      GetScanEntriesByCategoryPayload input) async {
    return _scanEntriesRepository.getScanEntriesByCategory(
      payload: input,
    );
  }
}
