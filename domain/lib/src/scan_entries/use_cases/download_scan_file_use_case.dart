import '../../../domain.dart';

class DownloadScanFileUseCase
    extends FutureUseCase<DownloadScanFilePayload, void> {
  final ScanEntriesRepository _scanEntriesRepository;

  DownloadScanFileUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<void> execute(DownloadScanFilePayload input) async {
    return _scanEntriesRepository.downloadScanFile(
      payload: input,
    );
  }
}
