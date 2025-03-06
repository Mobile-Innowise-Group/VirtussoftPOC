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
      pictures =
          await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? <String>[];

      if (pictures.isNotEmpty) {
        final Map<String, dynamic> json = await _uploadPhotosForRecognitionUseCase.execute(
          UploadPhotosForRecognitionPayload(
            localFilePaths: pictures,
          ),
        );

        await _appRouter.push(PreviewPdfResultRoute(parsedJSon: json));
      }
    } catch (e) {
      _appEventNotifier.notify(
        SnackBarErrorNotification(
          message: e.toString(),
        ),
      );
    }
  }
}
