import 'package:domain/domain.dart';

class SynchronizationRepositoryImpl implements SynchronizationRepository {
  @override
  Future<void> synchronize({
    required SynchronizeDataPayload payload,
  }) {
    // TODO check if the first launch

    // TODO: implement synchronize data from Remote to Local
    throw UnimplementedError();
  }
}
