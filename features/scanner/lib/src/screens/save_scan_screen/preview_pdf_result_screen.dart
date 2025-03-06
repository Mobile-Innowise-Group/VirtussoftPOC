import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/items_table_widget.dart';
import 'widgets/receipt_details_table.dart';

@RoutePage()
class PreviewPdfResultScreen extends StatelessWidget {
  final ReceiptModel receipt;
  final String photoPath;
  final String previewFilePath;

  const PreviewPdfResultScreen({
    required this.receipt,
    required this.photoPath,
    required this.previewFilePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.file(
                File(photoPath),
                frameBuilder: (
                  BuildContext context,
                  Widget child,
                  int? frame,
                  bool? wasSynchronouslyLoaded,
                ) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimens.BORDER_RADIUS_16),
                    ),
                    child: child,
                  );
                },
              ),
              const SizedBox(height: AppDimens.SIZE_24),
              ReceiptDetailsTable(
                vendorName: receipt.vendorName,
                address: receipt.address,
                receiptNumber: receipt.receiptNumber,
                receiptDate: receipt.receiptDate,
                totalAmount: receipt.totalAmount,
                currency: receipt.currency,
                paymentMethod: receipt.paymentMethod,
                taxNumber: receipt.taxNumber,
              ),
              const SizedBox(height: AppDimens.SIZE_24),
              ItemsTableWidget(
                items: receipt.lineItems,
              ),
              const SizedBox(height: AppDimens.SIZE_24),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => context.router.push(
          SavingScanEntryBottomSheetRoute(receipt: receipt),
        ),
        child: const Icon(Icons.save),
      ),
    );
  }
}
