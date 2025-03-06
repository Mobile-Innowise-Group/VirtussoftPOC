import 'package:domain/domain.dart';

import '../scan_entries.dart';

class ReceiptMapper {
  static ReceiptModel fromEntity(ReceiptEntity entity) {
    return ReceiptModel(
      vendorName: entity.vendorName,
      address: entity.address,
      receiptNumber: entity.receiptNumber,
      receiptDate: entity.receiptDate,
      totalAmount: entity.totalAmount,
      currency: entity.currency,
      paymentMethod: entity.paymentMethod,
      taxNumber: entity.taxNumber,
      lineItems: entity.lineItems.map(LineItemMapper.fromEntity).toList(),
    );
  }

  static ReceiptEntity toEntity(ReceiptModel model) {
    return ReceiptEntity(
      vendorName: model.vendorName,
      address: model.address,
      receiptNumber: model.receiptNumber,
      receiptDate: model.receiptDate,
      totalAmount: model.totalAmount,
      currency: model.currency,
      paymentMethod: model.paymentMethod,
      taxNumber: model.taxNumber,
      lineItems: model.lineItems.map(LineItemMapper.toEntity).toList(),
    );
  }
}
