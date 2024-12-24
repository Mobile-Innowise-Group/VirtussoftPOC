import 'package:domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../scan_entries.dart';

class ScanEntriesProviderImpl implements ScanEntriesProvider {
  final ExceptionsHandler _supabaseExceptionHandler;
  final SupabaseClient _supabaseClient;

  ScanEntriesProviderImpl({
    required SupabaseClient supabaseClient,
    required ExceptionsHandler supabaseExceptionHandler,
  })  : _supabaseClient = supabaseClient,
        _supabaseExceptionHandler = supabaseExceptionHandler;

  @override
  Future<ScanEntryEntity> createScanEntry({required CreateScanEntryRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient.rpc('create_scan_entry', params: <String, dynamic>{
          'scan_entry_path': request.path,
          'scan_entry_folder_id': request.folderId,
          'scan_entry_category_id': request.categoryId,
        });

        return ScanEntryEntity.fromJson(response);
      },
    );
  }

  @override
  Future<bool> deleteScanEntry({required DeleteScanEntryRequest request}) {
    // TODO: implement deleteScanEntry
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> getScanEntries({required GetScanEntriesRequest request}) {
    // TODO: implement getScanEntries
    throw UnimplementedError();
  }
}
