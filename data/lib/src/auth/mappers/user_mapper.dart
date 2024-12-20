import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_auth;

import '../entities/entities.dart';

class UserMapper {
  static UserModel? fromEntity(UserEntity? entity) {
    if (entity == null) {
      return null;
    }

    return UserModel(login: entity.login);
  }

  static UserEntity? toEntity(UserModel? model) {
    if (model == null) {
      return null;
    }

    return UserEntity(login: model.login);
  }

  static UserEntity? fromFirebaseUser(firebase_auth.User? firebaseUser) {
    final String? login = firebaseUser?.email;

    if (firebaseUser == null || login == null) {
      return null;
    }

    return UserEntity(login: login);
  }

  static UserEntity? fromSupabaseUser(supabase_auth.User? supabaseUser) {
    final String? login = supabaseUser?.email;

    if (supabaseUser == null || login == null) {
      return null;
    }

    return UserEntity(login: login);
  }
}
