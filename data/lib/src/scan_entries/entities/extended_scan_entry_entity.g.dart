// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_scan_entry_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtendedScanEntryEntityImpl _$$ExtendedScanEntryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ExtendedScanEntryEntityImpl(
      id: json['id'] as String,
      localPath: json['localPath'] as String,
      remotePath: json['remotePath'] as String,
      folder: FolderEntity.fromJson(json['folder'] as Map<String, dynamic>),
      category:
          CategoryEntity.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExtendedScanEntryEntityImplToJson(
        _$ExtendedScanEntryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localPath': instance.localPath,
      'remotePath': instance.remotePath,
      'folder': instance.folder.toJson(),
      'category': instance.category.toJson(),
    };
