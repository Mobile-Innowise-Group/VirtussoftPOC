import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_entity.freezed.dart';
part 'folder_entity.g.dart';

@freezed
class FolderEntity with _$FolderEntity {
  const factory FolderEntity({
    required String id,
    required String name,
    @JsonKey(readValue: _readIsPrivate) required bool isPrivate,
  }) = _FolderEntity;

  factory FolderEntity.fromJson(Map<String, dynamic> json) => _$FolderEntityFromJson(json);
}

Object? _readIsPrivate(Map<dynamic, dynamic> json, _) {
  return json['isPrivate'] ?? json['is_private'];
}
