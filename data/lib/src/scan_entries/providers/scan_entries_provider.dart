import 'package:domain/domain.dart';

import '../requests/upload_scan_file_request.dart';
import '../scan_entries.dart';

abstract class ScanEntriesProvider {
  Future<List<CategoryModel>> getScanEntries({
    required GetScanEntriesRequest request,
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
