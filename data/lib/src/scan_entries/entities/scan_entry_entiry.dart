import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_entry_entiry.freezed.dart';

part 'scan_entry_entiry.g.dart';

@freezed
class ScanEntryEntity with _$ScanEntryEntity {
  const factory ScanEntryEntity({
    required String id,
    @JsonKey(name: 'local_path') required String localPath,
    @JsonKey(name: 'remote_path') required String remotePath,
    @JsonKey(name: 'folder_id') required String folderId,
    @JsonKey(name: 'category_id') required String categoryId,
  }) = _ScanEntryEntity;

  factory ScanEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$ScanEntryEntityFromJson(json);
}
