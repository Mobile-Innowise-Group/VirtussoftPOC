import '../scan_entries.dart';

abstract class ScanEntriesRepository {
  Future<List<ScanEntryModel>> getAllUserScanEntries({
    required GetScanEntriesPayload payload,
  });

  Future<List<ScanEntryModel>> getScanEntriesByFolderId({
    required GetScanEntriesByFolderIdPayload payload,
  });

  Future<ScanEntryModel> createScanEntry({
    required CreateScanEntryPayload payload,
  });

  Future<bool> deleteScanEntry({
    required DeleteScanEntryPayload payload,
  });

  Future<List<ScanEntryModel>> getScanEntriesByCategory({
    required GetScanEntriesByCategoryPayload payload,
  });

  Future<void> downloadScanFile({
    required DownloadScanFilePayload payload,
  });
}
