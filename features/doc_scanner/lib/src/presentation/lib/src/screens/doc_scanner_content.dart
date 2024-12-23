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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<DocScannerBloc, DocScannerState>(
          bloc: _bloc,
          builder: (BuildContext context, DocScannerState state) {
            return const Text('Doc Dcanner');
          },
        ),
      ),
    );
  }
}
