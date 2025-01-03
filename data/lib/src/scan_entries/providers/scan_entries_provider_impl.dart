import 'dart:io';

import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../requests/get_scan_entries_by_folder_id_request.dart';
import '../requests/upload_scan_file_request.dart';
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
  Future<ScanEntryEntity> createScanEntry(
      {required CreateScanEntryRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient
            .rpc('create_scan_entry', params: <String, dynamic>{
          'p_user_id': request.userId,
          'p_folder_id': request.folderId,
          'p_category_id': request.categoryId,
          'p_local_path': request.localPath,
          'p_remote_path': request.remotePath,
        });

        return ScanEntryEntity.fromJson(response);
      },
    );
  }

  @override
  Future<String> uploadScanFile({required UploadScanFileRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final String fileName = PdfService.getFileNameByPath(request.localPath);

        await _supabaseClient.storage
            .from(
                'files') // TODO(Karatysh): do we have any class to collect supabase configs?
            .upload(
              fileName,
              File(request.localPath),
              fileOptions: const FileOptions(upsert: true),
            );

        final String publicUrl = Supabase.instance.client.storage
            .from('files')
            .getPublicUrl(fileName);

        return publicUrl;
      },
    );
  }

  @override
  Future<bool> deleteScanEntry({required DeleteScanEntryRequest request}) {
    // TODO: implement deleteScanEntry
    throw UnimplementedError();
  }

  @override
  Future<List<ScanEntryEntity>> getScanEntriesByFolderId(
      {required GetScanEntriesByFolderIdRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final List<Map<String, dynamic>> response = await _supabaseClient
            .rpc('get_scan_entries_by_folder', params: <String, dynamic>{
          'p_folder_id': request.folderId,
        });

        return response.map(ScanEntryEntity.fromJson).toList();
      },
    );
  }
}
