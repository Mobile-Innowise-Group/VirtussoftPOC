import '../scan_entries.dart';

abstract class ScanEntriesRepository {
  Future<List<ScanEntryModel>> getScanEntries({
    required GetScanEntriesPayload payload,
  });

  Future<ScanEntryModel> createScanEntry({
    required CreateScanEntryPayload payload,
  });

  Future<bool> deleteScanEntry({
    required DeleteScanEntryPayload payload,
  });
}
