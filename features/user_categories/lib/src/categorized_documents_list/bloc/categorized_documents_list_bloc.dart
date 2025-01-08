import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';
import 'package:path_provider/path_provider.dart';

part 'categorized_documents_list_event.dart';

part 'categorized_documents_list_state.dart';

class CategorizedDocumentsListBloc
    extends Bloc<CategorizedDocumentsListEvent, CategorizedDocumentsListState> {
  final GetScanEntriesByCategoryUseCase _getScanEntriesByCategoryUseCase;
  final CategoryModel _category;
  final AppEventNotifier _appEventNotifier;
  final AppRouter _appRouter;
  final BiometricService _biometricService;

  CategorizedDocumentsListBloc({
    required GetScanEntriesByCategoryUseCase getScanEntriesByCategoryUseCase,
    required AppEventNotifier appEventNotifier,
    required AppRouter appRouter,
    required CategoryModel category,
    required BiometricService biometricService,
  })  : _getScanEntriesByCategoryUseCase = getScanEntriesByCategoryUseCase,
        _category = category,
        _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _biometricService = biometricService,
        super(CategorizedDocumentsListState.initial()) {
    on<InitEvent>(_onInit);
    on<OpenScanEvent>(_onOpenScanEvent);
    on<CloseShareQrDialogEvent>(_onCloseShareQrDialogEvent);
    on<ShareFileEvent>(_onShareFile);
    on<ShowPrivateFilesEvent>(_onShowPrivateFilesEvent);

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
      final List<ScanEntryModel> publicScanEntries = scanEntries
          .where((ScanEntryModel scan) => !scan.folder.isPrivate)
          .toList();
      emit(state.copyWith(
        allScanEntries: scanEntries,
        shownScanEntries: publicScanEntries,
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
    final Directory directory = await getApplicationDocumentsDirectory();
    final String fileName = event.scan.localPath.split('/').last;
    await PdfService.openFile(
        '${directory.path}/${event.scan.folder.name}/$fileName');
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

  FutureOr<void> _onShowPrivateFilesEvent(
    ShowPrivateFilesEvent event,
    Emitter<CategorizedDocumentsListState> emit,
  ) async {
    if (!await _biometricService.authenticateWithBiometrics()) {
      emit(state.copyWith());
      return;
    }

    final List<ScanEntryModel> showScanEntries =
        List<ScanEntryModel>.of(state.allScanEntries);

    emit(
      state.copyWith(
        shownScanEntries: showScanEntries,
        isPrivateShown: true,
      ),
    );
  }
}
