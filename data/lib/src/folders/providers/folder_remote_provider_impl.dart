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
        final List<Map<String, dynamic>> response = await _supabaseClient
            .rpc('create_folder', params: <String, dynamic>{
          'folder_id': request.id,
          'name': request.name,
          'user_id': request.userId,
          'is_private': request.isPrivate,
        });

        return FolderMapper.toModel(FolderEntity.fromJson(response.first));
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
            .rpc('get_user_folders', params: <String, dynamic>{});

        return response
            .map((Map<String, dynamic> category) =>
                FolderMapper.toModel(FolderEntity.fromJson(category)))
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
        final List<dynamic> response = await _supabaseClient
            .rpc('get_user_folder_by_id', params: <String, dynamic>{
          'folder_id': request.folderId,
        });

        return FolderMapper.toModel(FolderEntity.fromJson(response.first));
      },
    );
  }

  @override
  Future<FolderModel> editFolder({required EditRemoteFolderRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response =
            await _supabaseClient.rpc('edit_folder', params: <String, dynamic>{
          'folder_id': request.folder.id,
          'folder_name': request.folder.name,
          'is_private_flag': request.folder.isPrivate,
        });
        return FolderMapper.toModel(FolderEntity.fromJson(response));
      },
    );
  }
}
