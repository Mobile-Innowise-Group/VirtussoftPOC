import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import '../enum/file_status.dart';

part 'document_scan_event.dart';

part 'document_scan_state.dart';

class DocumentScanBloc extends Bloc<DocumentScanEvent, DocumentScanState> {
  final DownloadScanFileUseCase _downloadScanFileUseCase;
  final AppEventNotifier _appEventNotifier;
  final ScanEntryModel _scan;

  DocumentScanBloc({
    required DownloadScanFileUseCase downloadScanFileUseCase,
    required AppEventNotifier appEventNotifier,
    required ScanEntryModel scan,
  })  : _scan = scan,
        _downloadScanFileUseCase = downloadScanFileUseCase,
        _appEventNotifier = appEventNotifier,
        super(DocumentScanState.initial()) {
    on<InitEvent>(_onInit);
    on<DownloadFileEvent>(_onDownloadFile);

    add(const InitEvent());
  }

  Future<void> _onInit(
    InitEvent event,
    Emitter<DocumentScanState> emit,
  ) async {
    final File file = File(_scan.localPath);
    if (file.existsSync()) {
      emit(state.copyWith(fileStatus: FileStatus.downloaded));
    } else {
      emit(state.copyWith(fileStatus: FileStatus.empty));
    }
  }

  Future<void> _onDownloadFile(
    DownloadFileEvent event,
    Emitter<DocumentScanState> emit,
  ) async {
    try {
      emit(state.copyWith(fileStatus: FileStatus.downloading));
      await _downloadScanFileUseCase.execute(
        DownloadScanFilePayload(
          remotePath: _scan.remotePath,
          localPath: _scan.localPath,
        ),
      );
      emit(state.copyWith(fileStatus: FileStatus.downloaded));
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
      emit(state.copyWith(fileStatus: FileStatus.error));
    }
  }
}
