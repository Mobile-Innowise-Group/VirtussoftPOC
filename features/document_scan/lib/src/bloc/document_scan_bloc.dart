import 'dart:async';
import 'dart:io';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

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
    on<OpenScanEvent>(_onOpenScanEvent);

    add(const InitEvent());
  }

  Future<void> _onInit(
    InitEvent event,
    Emitter<DocumentScanState> emit,
  ) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String fileName = _scan.localPath.split('/').last;

    final File file = File('${directory.path}/${_scan.folder.name}/$fileName');
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
          scan: _scan,
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

  FutureOr<void> _onOpenScanEvent(
    OpenScanEvent event,
    Emitter<DocumentScanState> emit,
  ) async {
    try {
      if (state.fileStatus != FileStatus.downloaded) {
        emit(state.copyWith(fileStatus: FileStatus.downloading));
        await _downloadScanFileUseCase.execute(
          DownloadScanFilePayload(
            scan: _scan,
          ),
        );
        emit(state.copyWith(fileStatus: FileStatus.downloaded));
      }

      final Directory directory = await getApplicationDocumentsDirectory();
      final String fileName = event.scan.localPath.split('/').last;
      await PdfService.openFile(
          '${directory.path}/${event.scan.folder.name}/$fileName');
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
