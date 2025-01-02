import '../../../domain.dart';

class CreateScanEntryUseCase
    extends FutureUseCase<CreateScanEntryPayload, ScanEntryModel> {
  final ScanEntriesRepository _scanEntriesRepository;

  CreateScanEntryUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<ScanEntryModel> execute(CreateScanEntryPayload input) async {
    return _scanEntriesRepository.createScanEntry(
      payload: input,
    );
  }
}
