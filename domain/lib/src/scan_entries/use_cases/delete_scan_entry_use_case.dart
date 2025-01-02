import '../../../domain.dart';

class DeleteScanEntryUseCase
    extends FutureUseCase<DeleteScanEntryPayload, bool> {
  final ScanEntriesRepository _scanEntriesRepository;

  DeleteScanEntryUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<bool> execute(DeleteScanEntryPayload input) async {
    return _scanEntriesRepository.deleteScanEntry(
      payload: input,
    );
  }
}
