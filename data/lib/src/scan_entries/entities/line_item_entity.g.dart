// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LineItemEntityImpl _$$LineItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$LineItemEntityImpl(
      description: json['description'] as String,
      quantity: json['quantity'] as String,
      unitPrice: json['unitPrice'] as String,
      totalPrice: json['totalPrice'] as String,
    );

Map<String, dynamic> _$$LineItemEntityImplToJson(
        _$LineItemEntityImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
    };
