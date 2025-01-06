import 'dart:async';
import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'categorized_documents_list_event.dart';

part 'categorized_documents_list_state.dart';

class CategorizedDocumentsListBloc
    extends Bloc<CategorizedDocumentsListEvent, CategorizedDocumentsListState> {
  final GetScanEntriesByCategoryUseCase _getScanEntriesByCategoryUseCase;
  final CategoryModel _category;
  final AppEventNotifier _appEventNotifier;
  final AppRouter _appRouter;

  CategorizedDocumentsListBloc({
    required GetScanEntriesByCategoryUseCase getScanEntriesByCategoryUseCase,
    required AppEventNotifier appEventNotifier,
    required AppRouter appRouter,
    required CategoryModel category,
  })  : _getScanEntriesByCategoryUseCase = getScanEntriesByCategoryUseCase,
        _category = category,
        _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        super(CategorizedDocumentsListState.initial()) {
    on<InitEvent>(_onInit);
    on<OpenScanEvent>(_onOpenScanEvent);
    on<CloseShareQrDialogEvent>(_onCloseShareQrDialogEvent);
    on<ShareFileEvent>(_onShareFile);

    add(const InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final List<ScanEntryModel> scanEntries =
          await _getScanEntriesByCategoryUseCase.execute(
        GetScanEntriesByCategoryPayload(
          category: _category,
        ),
      );
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

  FutureOr<void> _onOpenScanEvent(
    OpenScanEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    await PdfService.openFile(event.localUrl);
  }

  FutureOr<void> _onCloseShareQrDialogEvent(
    CloseShareQrDialogEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    emit(state.copyWith());
    await _appRouter.maybePopTop();
  }

  FutureOr<void> _onShareFile(
    ShareFileEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    await ShareService.shareFile(
      path: event.scan.localPath,
    );

    await _appRouter.maybePopTop();
  }
}
