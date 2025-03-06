import 'line_item_model.dart';

class ReceiptModel {
  final String vendorName;
  final String address;
  final String receiptNumber;
  final String receiptDate;
  final String totalAmount;
  final String currency;
  final String paymentMethod;
  final String taxNumber;
  final List<LineItemModel> lineItems;

  const ReceiptModel({
    required this.vendorName,
    required this.address,
    required this.receiptNumber,
    required this.receiptDate,
    required this.totalAmount,
    required this.currency,
    required this.paymentMethod,
    required this.taxNumber,
    required this.lineItems,
  });
}
