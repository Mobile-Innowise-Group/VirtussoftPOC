import '../payloads/synchronize_data_payload.dart';

abstract class SynchronizationRepository {
  Future<void> synchronize({
    required SynchronizeDataPayload payload,
  });
}
