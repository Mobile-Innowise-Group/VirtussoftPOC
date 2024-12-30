// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_entry_entiry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanEntryEntityImpl _$$ScanEntryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanEntryEntityImpl(
      id: json['id'] as String,
      localPath: json['local_path'] as String,
      remotePath: json['remote_path'] as String,
      folderId: json['folder_id'] as String,
      categoryId: json['category_id'] as String,
    );

Map<String, dynamic> _$$ScanEntryEntityImplToJson(
        _$ScanEntryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'local_path': instance.localPath,
      'remote_path': instance.remotePath,
      'folder_id': instance.folderId,
      'category_id': instance.categoryId,
    };
