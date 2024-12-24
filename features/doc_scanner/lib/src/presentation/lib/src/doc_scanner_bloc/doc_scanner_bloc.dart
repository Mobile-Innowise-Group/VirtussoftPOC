import 'package:core/core.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:navigation/navigation.dart';

import 'package:doc_scanner/src/core/lib/core.dart';

part 'doc_scanner_event.dart';

part 'doc_scanner_state.dart';

class DocScannerBloc extends Bloc<DocScannerEvent, DocScannerState> {
  final AppRouter _appRouter;

  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  DocScannerBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const DocScannerState.initial()) {
    on<OpenScanner>(_onOpenScanner);
  }

  Future<void> _onOpenScanner(
    OpenScanner event,
    Emitter<DocScannerState> emit,
  ) async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ?? [];

      _processImage(pictures);
    } catch (exception) {
      // TODO(Karatysh): handle error if need
    }
  }

  Future<void> _processImage(List<String> pictures) async {
    final List<RecognizedText> recognizedText = [];

    for (final path in pictures) {
      final inputImage = InputImage.fromFilePath(path);

      final RecognizedText result = await _textRecognizer.processImage(inputImage);

      recognizedText.add(result);
    }

    await PdfService.generateCenteredText(
      recognizedText.map((RecognizedText item) => item.text).toList(),
    );
  }
}
