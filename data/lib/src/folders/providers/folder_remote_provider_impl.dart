import 'package:domain/src/folders/models/folder_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../folders.dart';

class FolderRemoteProviderImpl implements FolderRemoteProvider {
  final ExceptionsHandler _supabaseExceptionHandler;
  final SupabaseClient _supabaseClient;

  FolderRemoteProviderImpl({
    required SupabaseClient supabaseClient,
    required ExceptionsHandler supabaseExceptionHandler,
  })  : _supabaseClient = supabaseClient,
        _supabaseExceptionHandler = supabaseExceptionHandler;

  @override
  Future<FolderModel> createFolder({
    required CreateFolderRemoteRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient
            .rpc('add_new_folder', params: <String, dynamic>{
          'folder_name': request.name,
          'folder_id': request.id,
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
  Future<List<FolderModel>> getFolders({
    required GetFoldersRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final List<Map<String, dynamic>> response = await _supabaseClient
            .rpc('get_user_new_folders', params: <String, dynamic>{});

        return response
            .map((Map<String, dynamic> category) => FolderMapper.toModel(FolderEntity.fromJson(category)))
            .toList();
      },
    );
  }

  @override
  Future<FolderModel> getUserFolderById({
    required GetFolderByIdRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient.rpc('get_user_folder', params: <String, dynamic>{
          'folder_id': request.folderId,
        });

        return FolderMapper.toModel(FolderEntity.fromJson(response));
      },
    );
  }
}
