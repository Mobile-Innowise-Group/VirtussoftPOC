import '../../../domain.dart';

class UploadPhotosForRecognitionUseCase
    extends FutureUseCase<UploadPhotosForRecognitionPayload, ReceiptModel> {
  final ScanEntriesRepository _scanEntriesRepository;

  UploadPhotosForRecognitionUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<ReceiptModel> execute(UploadPhotosForRecognitionPayload input) {
    return _scanEntriesRepository.uploadPhotosForRecognition(payload: input);
  }
}
