// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptEntityImpl _$$ReceiptEntityImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptEntityImpl(
      vendorName: json['vendorName'] as String,
      address: json['address'] as String,
      receiptNumber: json['receiptNumber'] as String,
      receiptDate: json['receiptDate'] as String,
      totalAmount: json['totalAmount'] as String,
      currency: json['currency'] as String,
      paymentMethod: json['paymentMethod'] as String,
      taxNumber: json['taxNumber'] as String,
      lineItems: (json['lineItems'] as List<dynamic>?)
              ?.map((e) => LineItemEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LineItemEntity>[],
    );

Map<String, dynamic> _$$ReceiptEntityImplToJson(_$ReceiptEntityImpl instance) =>
    <String, dynamic>{
      'vendorName': instance.vendorName,
      'address': instance.address,
      'receiptNumber': instance.receiptNumber,
      'receiptDate': instance.receiptDate,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
      'taxNumber': instance.taxNumber,
      'lineItems': instance.lineItems.map((e) => e.toJson()).toList(),
    };
