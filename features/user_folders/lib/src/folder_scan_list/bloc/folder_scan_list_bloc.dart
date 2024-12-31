import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'folder_scan_list_event.dart';

part 'folder_scan_list_state.dart';

class FolderScanListBloc extends Bloc<FolderScanListEvent, FolderScanListState> {
  final AppEventNotifier _appEventNotifier;
  final GetScanEntriesByFolderUseCase _getScanEntriesByFolderUseCase;
  final AppRouter _appRouter;
  final FolderModel _folder;

  FolderScanListBloc({
    required AppEventNotifier appEventNotifier,
    required GetScanEntriesByFolderUseCase getScanEntriesByFolderUseCase,
    required AppRouter appRouter,
    required FolderModel folder,
  })  : _appEventNotifier = appEventNotifier,
        _getScanEntriesByFolderUseCase = getScanEntriesByFolderUseCase,
        _appRouter = appRouter,
        _folder = folder,
        super(FolderScanListState.initial()) {
    on<InitEvent>(_onInit);
    on<ShareScanEvent>(_onShareScanEvent);
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<FolderScanListState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final List<ScanEntryModel> scans = await _getScanEntriesByFolderUseCase.execute(
        GetScanEntriesByFolderIdPayload(folder: _folder),
      );
      emit(
        state.copyWith(
          isLoading: false,
          scans: scans,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _appEventNotifier.notify(
        SnackBarErrorNotification(message: e.toString()),
      );
    }
  }

  FutureOr<void> _onShareScanEvent(
    ShareScanEvent event,
    Emitter<FolderScanListState> emit,
  ) async {}
}
