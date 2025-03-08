import 'package:freezed_annotation/freezed_annotation.dart';

import '../../categories/categories.dart';
import '../../folders/folders.dart';

part 'extended_scan_entry_entity.freezed.dart';
part 'extended_scan_entry_entity.g.dart';

@freezed
class ExtendedScanEntryEntity with _$ExtendedScanEntryEntity {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory ExtendedScanEntryEntity({
    required String id,
    required String localPath,
    required String remotePath,
    required FolderEntity folder,
    required CategoryEntity category,
  }) = _ExtendedScanEntryEntity;

  factory ExtendedScanEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$ExtendedScanEntryEntityFromJson(json);
}
