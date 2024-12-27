import 'package:domain/domain.dart';

import '../entities/entities.dart';

class SignUpPayloadMapper {
  static SignUpPayloadModel fromEntity(SignUpPayloadEntity entity) {
    return SignUpPayloadModel(
      email: entity.email,
      password: entity.password,
      username: entity.username,
    );
  }

  static SignUpPayloadEntity toEntity(SignUpPayloadModel model) {
    return SignUpPayloadEntity(
      email: model.email,
      password: model.password,
      username: model.username,
    );
  }
}
