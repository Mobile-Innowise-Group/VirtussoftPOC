import '../../../domain.dart';

class CreateScanEntryPayload {
  final ReceiptModel receipt;
  final FolderModel folder;
  final String categoryId;

  CreateScanEntryPayload({
    required this.receipt,
    required this.folder,
    required this.categoryId,
  });
}
