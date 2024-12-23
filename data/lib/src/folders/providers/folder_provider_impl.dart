import 'package:domain/src/folders/models/folder_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../folders.dart';

class FolderProviderImpl implements FolderProvider {
  final ExceptionsHandler _supabaseExceptionHandler;
  final SupabaseClient _supabaseClient;

  FolderProviderImpl({
    required SupabaseClient supabaseClient,
    required ExceptionsHandler supabaseExceptionHandler,
  })  : _supabaseClient = supabaseClient,
        _supabaseExceptionHandler = supabaseExceptionHandler;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient
            .rpc('create_folder', params: <String, dynamic>{
          'folder_name': request.name,
        });

        return FolderMapper.toModel(FolderEntity.fromJson(response));
      },
    );
  }

  @override
  Future<bool> deleteFolder({
    required DeleteFolderRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        await _supabaseClient.rpc('delete_folder', params: <String, dynamic>{
          'folder_id': request.folderId,
        });

        return true;
      },
    );
  }

  @override
  Future<List<FolderModel>> getUserFolders({
    required GetFoldersRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final List<Map<String, dynamic>> response = await _supabaseClient
            .rpc('get_user_folders', params: <String, dynamic>{});

        return response
            .map((Map<String, dynamic> category) =>
                FolderMapper.toModel(FolderEntity.fromJson(category)))
            .toList();
      },
    );
  }
}
