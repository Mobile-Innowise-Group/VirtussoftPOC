import '../../../domain.dart';
import '../payloads/upload_photos_for_recognition_payload.dart';

class UploadPhotosForRecognitionUseCase
    extends FutureUseCase<UploadPhotosForRecognitionPayload, Map<String, dynamic>> {
  final ScanEntriesRepository _scanEntriesRepository;

  UploadPhotosForRecognitionUseCase({
    required ScanEntriesRepository scanEntriesRepository,
  }) : _scanEntriesRepository = scanEntriesRepository;

  @override
  Future<Map<String, dynamic>> execute(UploadPhotosForRecognitionPayload input) {
    return _scanEntriesRepository.uploadPhotosForRecognition(payload: input);
  }
}
