import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class PreviewPdfResultScreen extends StatefulWidget {
  final Map<String, dynamic> parsedJSon;

  const PreviewPdfResultScreen({
    required this.parsedJSon,
    super.key,
  });

  @override
  State<PreviewPdfResultScreen> createState() => _PreviewPdfResultScreenState();
}

class _PreviewPdfResultScreenState extends State<PreviewPdfResultScreen> {
  // late final PdfControllerPinch pdfPinchController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   pdfPinchController = PdfControllerPinch(
  //     document: PdfDocument.openFile(widget.previewFilePath),
  //   );
  // }
  //
  // @override
  // void dispose() {
  //   pdfPinchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preview saving file',
          style: AppFonts.headingH4,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                // PdfViewPinch(
                //   controller: pdfPinchController,
                // ),
                Text('${widget.parsedJSon}'),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.PADDING_16),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      // onPressed: () => context.router.push(
                      //   SavingScanEntryBottomSheetRoute(
                      //     previewFilePath: widget.previewFilePath,
                      //   ),
                      // ),
                      onPressed: () {},
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
