import 'package:core/core.dart';
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
            'scanResults.extractedDetails'.tr(),
            style: AppFonts.headingH2,
          ),
        ),
        const SizedBox(height: AppDimens.SIZE_12),
        ReceiptDetailsItem(label: 'scanResults.vendor'.tr(), value: vendorName),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.address'.tr(), value: address),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.receiptNumber'.tr(), value: receiptNumber),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.receiptDate'.tr(), value: receiptDate),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.totalAmount'.tr(), value: totalAmount),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.currency'.tr(), value: currency),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.paymentMethod'.tr(), value: paymentMethod),
        const SizedBox(height: AppDimens.SIZE_2),
        ReceiptDetailsItem(label: 'scanResults.taxNumber'.tr(), value: taxNumber),
      ],
    );
  }
}
