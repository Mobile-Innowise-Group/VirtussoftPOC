import '../../../../domain.dart';
import '../synchronization.dart';

class SynchronizeDataUseCase
    extends FutureUseCase<SynchronizeDataPayload, void> {
  final SynchronizationRepository _synchronizationRepository;

  SynchronizeDataUseCase({
    required SynchronizationRepository synchronizationRepository,
  }) : _synchronizationRepository = synchronizationRepository;

  @override
  Future<void> execute(SynchronizeDataPayload input) async {
    return _synchronizationRepository.synchronize(
      payload: input,
    );
  }
}
