import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:pdfx/pdfx.dart';

@RoutePage()
class PreviewPdfResultScreen extends StatefulWidget {
  final String previewFilePath;

  const PreviewPdfResultScreen({
    required this.previewFilePath,
    super.key,
  });

  @override
  State<PreviewPdfResultScreen> createState() => _PreviewPdfResultScreenState();
}

class _PreviewPdfResultScreenState extends State<PreviewPdfResultScreen> {
  late final PdfControllerPinch pdfPinchController;

  @override
  void initState() {
    super.initState();

    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openFile(widget.previewFilePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview saving file'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PdfViewPinch(
                  controller: pdfPinchController,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.PADDING_16),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () => context.router.push(
                        SavingScanEntryBottomSheetRoute(
                          previewFilePath: widget.previewFilePath,
                        ),
                      ),
                      child: const Icon(Icons.save),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
