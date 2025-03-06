import 'package:freezed_annotation/freezed_annotation.dart';

import 'line_item_entity.dart';

part 'receipt_entity.freezed.dart';
part 'receipt_entity.g.dart';

@freezed
class ReceiptEntity with _$ReceiptEntity {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory ReceiptEntity({
    required String vendorName,
    required String address,
    required String receiptNumber,
    required String receiptDate,
    required String totalAmount,
    required String currency,
    required String paymentMethod,
    required String taxNumber,
    required List<LineItemEntity> lineItems,
  }) = _ReceiptEntity;

  factory ReceiptEntity.fromJson(Map<String, dynamic> json) => _$ReceiptEntityFromJson(json);
}
