import '../requests/get_scan_entries_by_folder_id_request.dart';
import '../requests/upload_scan_file_request.dart';
import '../scan_entries.dart';

abstract class ScanEntriesProvider {
  Future<List<ScanEntryEntity>> getScanEntriesByFolderId({
    required GetScanEntriesByFolderIdRequest request,
  });

  Future<bool> deleteScanEntry({
    required DeleteScanEntryRequest request,
  });

  Future<ScanEntryEntity> createScanEntry({
    required CreateScanEntryRequest request,
  });

  Future<String> uploadScanFile({
    required UploadScanFileRequest request,
  });
}
