import 'package:domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/exceptions/handlers/exception_handler.dart';
import '../categories.dart';

class CategoryRemoteProviderImpl implements CategoryRemoteProvider {
  final ExceptionsHandler _supabaseExceptionHandler;
  final SupabaseClient _supabaseClient;

  CategoryRemoteProviderImpl({
    required SupabaseClient supabaseClient,
    required ExceptionsHandler supabaseExceptionHandler,
  })  : _supabaseClient = supabaseClient,
        _supabaseExceptionHandler = supabaseExceptionHandler;

  @override
  Future<CategoryModel> createCategory({
    required CreateCategoryRemoteRequest request,
  }) async {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient
            .rpc('add_new_category', params: <String, dynamic>{
          'category_name': request.name,
          'category_id': request.id,
        });

        return CategoryMapper.toModel(CategoryEntity.fromJson(response));
      },
    );
  }

  @override
  Future<bool> deleteCategory({
    required DeleteCategoryRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        await _supabaseClient.rpc('delete_category', params: <String, dynamic>{
          'category_id': request.categoryId,
        });

        return true;
      },
    );
  }

  @override
  Future<List<CategoryModel>> getCategories({
    required GetCategoriesRequest request,
  }) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final List<Map<String, dynamic>> response = await _supabaseClient
            .rpc('get_user_new_categories', params: <String, dynamic>{});

        return response
            .map((Map<String, dynamic> category) => CategoryMapper.toModel(CategoryEntity.fromJson(category)))
            .toList();
      },
    );
  }

  @override
  Future<CategoryModel> getUserCategoryById({required GetUserCategoryByIdRequest request}) {
    return _supabaseExceptionHandler.safeExecute(
      execute: () async {
        final Map<String, dynamic> response = await _supabaseClient.rpc('get_user_category', params: <String, dynamic>{
          'category_id': request.categoryId,
        });

        return CategoryMapper.toModel(CategoryEntity.fromJson(response));
      },
    );
  }
}
