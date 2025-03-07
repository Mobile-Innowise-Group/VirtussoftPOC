import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final UploadPhotosForRecognitionUseCase _uploadPhotosForRecognitionUseCase;

  ScannerBloc({
    required AppRouter appRouter,
    required AppEventNotifier appEventNotifier,
    required UploadPhotosForRecognitionUseCase uploadPhotosForRecognitionUseCase,
  })  : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _uploadPhotosForRecognitionUseCase = uploadPhotosForRecognitionUseCase,
        super(const ScannerState.initial()) {
    on<OpenScanner>(_onOpenScanner);
  }

  Future<void> _onOpenScanner(
    OpenScanner event,
    Emitter<ScannerState> emit,
  ) async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(
            isGalleryImportAllowed: true,
            noOfPages: 1,
          ) ??
          const <String>[];

      if (pictures.isNotEmpty) {
        emit(
          state.copyWith(isProcessing: true),
        );

        final ReceiptModel receipt = await _uploadPhotosForRecognitionUseCase.execute(
          UploadPhotosForRecognitionPayload(
            localFilePaths: pictures,
          ),
        );

        final File file = await PdfService.generateCenteredText(
          const <String>['This', 'is', 'mock', 'data'],
        );

        await _appRouter.push(
          PreviewPdfResultRoute(
            receipt: receipt,
            previewFilePath: file.path,
            photoPath: pictures.first,
          ),
        );
      }
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    } finally {
      emit(
        state.copyWith(isProcessing: false),
      );
    }
  }
}
