import 'package:core/core.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:navigation/navigation.dart';

part 'scanner_event.dart';

part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final AppRouter _appRouter;

  final TextRecognizer _textRecognizer = TextRecognizer();

  ScannerBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const ScannerState.initial()) {
    on<OpenScanner>(_onOpenScanner);
  }

  Future<void> _onOpenScanner(
    OpenScanner event,
    Emitter<ScannerState> emit,
  ) async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? <String>[];

      await _processImage(pictures);
    } catch (exception) {
      // TODO(Karatysh): handle error if need
    }
  }

  Future<void> _processImage(List<String> pictures) async {
    final List<RecognizedText> recognizedText = <RecognizedText>[];

    for (final String path in pictures) {
      final InputImage inputImage = InputImage.fromFilePath(path);

      final RecognizedText result = await _textRecognizer.processImage(inputImage);

      recognizedText.add(result);
    }

    await PdfService.generateCenteredText(
      recognizedText.map((RecognizedText item) => item.text).toList(),
    );
  }
}
