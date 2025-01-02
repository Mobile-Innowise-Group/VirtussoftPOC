// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_local_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderLocalEntityImpl _$$FolderLocalEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$FolderLocalEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isPrivate: (json['isPrivate'] as num).toInt(),
    );

Map<String, dynamic> _$$FolderLocalEntityImplToJson(
        _$FolderLocalEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPrivate': instance.isPrivate,
    };
