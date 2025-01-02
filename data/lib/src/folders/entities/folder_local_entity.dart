import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_local_entity.freezed.dart';

part 'folder_local_entity.g.dart';

@freezed
class FolderLocalEntity with _$FolderLocalEntity {
  const factory FolderLocalEntity({
    required String id,
    required String name,
    required int isPrivate,
  }) = _FolderLocalEntity;

  factory FolderLocalEntity.fromJson(Map<String, dynamic> json) =>
      _$FolderLocalEntityFromJson(json);
}
