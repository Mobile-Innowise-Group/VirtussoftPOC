import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_auth;

import '../entities/entities.dart';

class UserMapper {
  static UserModel? fromEntity(UserEntity? entity) {
    if (entity == null) {
      return null;
    }

    return UserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
    );
  }

  static UserEntity? toEntity(UserModel? model) {
    if (model == null) {
      return null;
    }

    return UserEntity(
      id: model.id,
      email: model.email,
      username: '',
    );
  }

  static UserEntity? fromFirebaseUser(firebase_auth.User? firebaseUser) {
    final String? email = firebaseUser?.email;

    if (firebaseUser == null || email == null) {
      return null;
    }

    return UserEntity(
      id: firebaseUser.uid,
      email: email,
      username: '',
    );
  }

  static UserEntity? fromSupabaseUser(
      {required supabase_auth.User? supabaseUser}) {
    final String? email = supabaseUser?.email;

    if (supabaseUser == null || email == null) {
      return null;
    }

    final Map<String, Object?>? userMetadata = supabaseUser.userMetadata?.map(
      (String key, dynamic value) =>
          MapEntry<String, Object?>(key, value as Object?),
    );

    if (userMetadata == null) {
      return null;
    }

    return UserEntity.fromJson(userMetadata);
  }
}
