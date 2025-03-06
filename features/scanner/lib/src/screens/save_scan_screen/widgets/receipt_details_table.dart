import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'receipt_details_item.dart';

class ReceiptDetailsTable extends StatelessWidget {
  final String vendorName;
  final String address;
  final String receiptNumber;
  final String receiptDate;
  final String totalAmount;
  final String currency;
  final String paymentMethod;
  final String taxNumber;

  const ReceiptDetailsTable({
    super.key,
    required this.vendorName,
    required this.address,
    required this.receiptNumber,
    required this.receiptDate,
    required this.totalAmount,
    required this.currency,
    required this.paymentMethod,
    required this.taxNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Extracted details',
            style: AppFonts.headingH1,
          ),
        ),
        const SizedBox(height: AppDimens.SIZE_12),
        ReceiptDetailsItem(label: 'Vendor Name', value: vendorName),
        ReceiptDetailsItem(label: 'Address', value: address),
        ReceiptDetailsItem(label: 'Receipt Number', value: receiptNumber),
        ReceiptDetailsItem(label: 'Receipt Date', value: receiptDate),
        ReceiptDetailsItem(label: 'Total Amount', value: totalAmount),
        ReceiptDetailsItem(label: 'Currency ', value: currency),
        ReceiptDetailsItem(label: 'Payment Method ', value: paymentMethod),
        ReceiptDetailsItem(label: 'Tax Number ', value: taxNumber),
      ],
    );
  }
}
