// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderEntityImpl _$$FolderEntityImplFromJson(Map<String, dynamic> json) =>
    _$FolderEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isPrivate: json['is_private'] as bool,
    );

Map<String, dynamic> _$$FolderEntityImplToJson(_$FolderEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_private': instance.isPrivate,
    };
