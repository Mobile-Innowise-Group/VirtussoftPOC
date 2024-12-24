import '../../../domain.dart';

class DeleteScanEntryPayload {
  final ScanEntryModel scanEntry;

  DeleteScanEntryPayload({
    required this.scanEntry,
  });
}
