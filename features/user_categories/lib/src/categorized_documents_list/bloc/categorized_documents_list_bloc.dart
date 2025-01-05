import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'categorized_documents_list_event.dart';

part 'categorized_documents_list_state.dart';

class CategorizedDocumentsListBloc
    extends Bloc<CategorizedDocumentsListEvent, CategorizedDocumentsListState> {
  final GetAllUserScanEntriesUseCase _getScanEntriesUseCase;
  final AppEventNotifier _appEventNotifier;

  CategorizedDocumentsListBloc({
    required GetAllUserScanEntriesUseCase getScanEntriesUseCase,
    required AppEventNotifier appEventNotifier,
  })  : _getScanEntriesUseCase = getScanEntriesUseCase,
        _appEventNotifier = appEventNotifier,
        super(CategorizedDocumentsListState.initial()) {
    on<InitEvent>(_onInit);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final List<ScanEntryModel> scanEntries =
          await _getScanEntriesUseCase.execute(GetScanEntriesPayload());
      emit(state.copyWith(
        scanEntries: scanEntries,
        isLoading: false,
      ));
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
