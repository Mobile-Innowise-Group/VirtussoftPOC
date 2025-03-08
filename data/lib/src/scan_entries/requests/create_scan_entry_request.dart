import '../entities/receipt_entity.dart';

class CreateScanEntryRequest {
  final String userId;
  final String localPath;
  final String folderId;
  final String categoryId;
  final ReceiptEntity receipt;

  CreateScanEntryRequest({
    required this.userId,
    required this.localPath,
    required this.folderId,
    required this.categoryId,
    required this.receipt,
  });
}
