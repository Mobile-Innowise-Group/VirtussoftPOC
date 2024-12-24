import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SynchronizeDataUseCase _synchronizeDataUseCase;

  HomeBloc({
    required SynchronizeDataUseCase synchronizeDataUseCase,
  })  : _synchronizeDataUseCase = synchronizeDataUseCase,
        super(HomeInitial()) {
    on<HomeInit>(_onInit);
  }

  FutureOr<void> _onInit(
    HomeInit event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _synchronizeDataUseCase.execute(SynchronizeDataPayload());
    } catch (e) {
      AppLogger().error(e.toString());
    }
  }
}
