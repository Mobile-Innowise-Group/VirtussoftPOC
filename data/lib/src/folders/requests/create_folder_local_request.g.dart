// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_local_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFolderLocalRequestImpl _$$CreateFolderLocalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFolderLocalRequestImpl(
      name: json['name'] as String,
      isPrivate: (json['is_private'] as num).toInt(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$CreateFolderLocalRequestImplToJson(
        _$CreateFolderLocalRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_private': instance.isPrivate,
      'id': instance.id,
    };
