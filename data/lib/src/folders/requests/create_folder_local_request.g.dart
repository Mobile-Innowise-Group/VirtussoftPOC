// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_local_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFolderLocalRequestImpl _$$CreateFolderLocalRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFolderLocalRequestImpl(
      name: json['name'] as String,
      isPrivate: (json['isPrivate'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateFolderLocalRequestImplToJson(
        _$CreateFolderLocalRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isPrivate': instance.isPrivate,
    };
