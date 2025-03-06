import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../requests/get_scan_entries_by_folder_id_request.dart';
import '../requests/upload_photos_request.dart';
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
  Future<ScanEntryEntity> createScanEntry({required CreateScanEntryRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response =
            await _supabaseClient.rpc('create_scan_entry', params: <String, dynamic>{
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
            .from('files') // TODO(Karatysh): do we have any class to collect supabase configs?
            .upload(
              fileName,
              File(request.localPath),
              fileOptions: const FileOptions(upsert: true),
            );

        final String publicUrl =
            Supabase.instance.client.storage.from('files').getPublicUrl(fileName);

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
        final List<Map<String, dynamic>> response =
            await _supabaseClient.rpc('get_scan_entries_by_folder', params: <String, dynamic>{
          'p_folder_id': request.folderId,
        });

        return response.map(ScanEntryEntity.fromJson).toList();
      },
    );
  }

  @override
  Future<List<ScanEntryModel>> getAllUserScanEntries({
    required GetAllUserScanEntriesRequest request,
  }) {
    // TODO: implement getAllUserScanEntries
    throw UnimplementedError();
  }

  @override
  Future<List<ScanEntryEntity>> getScanEntriesByCategory({
    required GetUserScansByCategoryRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final List<Map<String, dynamic>> response =
            await _supabaseClient.rpc('get_user_scans_by_category', params: <String, dynamic>{
          'p_category_id': request.categoryId,
        });

        return response.map(ScanEntryEntity.fromJson).toList();
      },
    );
  }

  @override
  Future<Uint8List> downloadScanFile({
    required DownloadScanFileRequest request,
  }) {
    final String path = request.remotePath.split('/').last;
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        return _supabaseClient.storage
            .from('files') // TODO(Karatysh): do we have any class to collect supabase configs?
            .download(path);
      },
    );
  }

  @override
  Future<Map<String, dynamic>> uploadPhotos({
    required UploadPhotosRequest request,
  }) async {
    final String? baseUrl = dotenv.env['SUPABASE_URL'];
    final String? secretKey = dotenv.env['SUPABASE_KEY'];

    if (baseUrl == null || secretKey == null) {
      throw const AppException('Unable to make a request');
    }

    final File file = request.files.first;
    final String fileName = basename(file.path);
    final String fileExtension = extension(file.path);
    final Uint8List fileBytes = await file.readAsBytes();
    final Uri requestUri = Uri.parse('$baseUrl/functions/v1/handle_receipt_analysis');
    final String boundary = '${DateTime.timestamp().millisecondsSinceEpoch}';

    final HttpClient httpClient = HttpClient();

    try {
      final HttpClientRequest httpRequest = await httpClient.openUrl('POST', requestUri);

      httpRequest.headers
          .set(HttpHeaders.contentTypeHeader, 'multipart/form-data; boundary=$boundary');
      httpRequest.headers.set(HttpHeaders.acceptEncodingHeader, 'gzip, deflate, br');
      httpRequest.headers.set(HttpHeaders.connectionHeader, 'keep-alive');
      httpRequest.headers.set(HttpHeaders.cacheControlHeader, 'no-cache');
      httpRequest.headers.set(HttpHeaders.authorizationHeader, 'Bearer $secretKey');
      httpRequest.headers.set(HttpHeaders.acceptHeader, '*/*');

      httpRequest
        ..add(utf8.encode('--$boundary\r\n'))
        ..add(utf8.encode('Content-Disposition: form-data; name="file"; filename="$fileName"\r\n'))
        ..add(utf8.encode('Content-Type: image/$fileExtension\r\n\r\n'))
        ..add(fileBytes)
        ..add(utf8.encode('\r\n--$boundary--\r\n'));

      final HttpClientResponse response = await httpRequest.close();
      final String responseString = await response.transform(utf8.decoder).join();
      final dynamic decoded = jsonDecode(responseString);

      return decoded is Map<String, dynamic> ? decoded : <String, dynamic>{'documents': decoded};
    } finally {
      httpClient.close();
    }
  }
}
