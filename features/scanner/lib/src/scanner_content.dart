import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'bloc/scanner_bloc.dart';

class ScannerScreenContent extends StatefulWidget {
  const ScannerScreenContent({super.key});

  @override
  State<ScannerScreenContent> createState() => _ScannerScreenContentState();
}

class _ScannerScreenContentState extends State<ScannerScreenContent> {
  late final ScannerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ScannerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _bloc.add(const OpenScanner());
        },
        child: const Text("Scan Document"),
      ),
    );
  }
}
