import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../doc_scanner_bloc/doc_scanner_bloc.dart';

class DocScannerScreenContent extends StatefulWidget {
  const DocScannerScreenContent({super.key});

  @override
  State<DocScannerScreenContent> createState() => _DocScannerScreenContentState();
}

class _DocScannerScreenContentState extends State<DocScannerScreenContent> {
  late final DocScannerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<DocScannerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'docScanner.docScanner'.tr(),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _bloc.add(const OpenScanner());
          },
          child: const Text("Scan Document"),
        ),
      ),
    );
  }
}
