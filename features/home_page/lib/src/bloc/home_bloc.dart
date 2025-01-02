import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Stream<bool> networkStream = NetworkService.observeConnection;
  final SynchronizeDataUseCase _synchronizeDataUseCase;

  HomeBloc({
    required SynchronizeDataUseCase synchronizeDataUseCase,
  })  : _synchronizeDataUseCase = synchronizeDataUseCase,
        super(HomeState.initial()) {
    on<HomeInit>(_onInit);

    add(HomeInit());
  }

  FutureOr<void> _onInit(
    HomeInit event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _synchronizeDataUseCase.execute(SynchronizeDataPayload());
      emit(state.copyWith(isLoading: false));
      await emit.forEach(NetworkService.observeConnection,
          onData: (bool isConnected) {
        return state.copyWith(isInternetConnected: isConnected);
      });
    } catch (e) {
      AppLogger().error(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
