import '../../../domain.dart';

class CreateScanEntryPayload {
  final ReceiptModel receipt;
  final String folderId;
  final String categoryId;

  CreateScanEntryPayload({
    required this.receipt,
    required this.folderId,
    required this.categoryId,
  });
}
