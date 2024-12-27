// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_entry_entiry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanEntryEntityImpl _$$ScanEntryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanEntryEntityImpl(
      id: json['id'] as String,
      path: json['path'] as String,
      folderId: (json['folderId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$$ScanEntryEntityImplToJson(
        _$ScanEntryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'folderId': instance.folderId,
      'categoryId': instance.categoryId,
    };
