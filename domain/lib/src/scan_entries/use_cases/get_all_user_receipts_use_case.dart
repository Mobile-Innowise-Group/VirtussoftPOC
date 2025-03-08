import '../../../domain.dart';

class GetAllUserReceiptsUseCase
    extends FutureUseCase<GetAllUserReceiptsPayload, List<ReceiptModel>> {
  final ScanEntriesRepository _scanEntriesRepository;

  GetAllUserReceiptsUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<List<ReceiptModel>> execute(GetAllUserReceiptsPayload input) {
    return _scanEntriesRepository.getAllUserReceipts(payload: input);
  }
}
