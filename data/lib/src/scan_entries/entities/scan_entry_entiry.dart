import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_entry_entiry.freezed.dart';

part 'scan_entry_entiry.g.dart';

@freezed
class ScanEntryEntity with _$ScanEntryEntity {
  const factory ScanEntryEntity({
    required String id,
    required String path,
    required int folderId,
    required int categoryId,
  }) = _ScanEntryEntity;

  factory ScanEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$ScanEntryEntityFromJson(json);
}
