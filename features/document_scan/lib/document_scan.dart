library document_scan;

import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'src/bloc/document_scan_bloc.dart';
import 'src/widgets/document_scan_widget.dart';

class DocumentScan extends StatelessWidget {
  final ScanEntryModel scan;
  final VoidCallback onTap;
  final VoidCallback onClose;
  final VoidCallback onShareFile;
  final Function(Uint8List qrCodeBites) onShareQr;

  const DocumentScan({
    super.key,
    required this.scan,
    required this.onTap,
    required this.onClose,
    required this.onShareFile,
    required this.onShareQr,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentScanBloc>(
      create: (_) => DocumentScanBloc(
        downloadScanFileUseCase: appLocator.get<DownloadScanFileUseCase>(),
        appEventNotifier: appLocator.get<AppEventNotifier>(),
        scan: scan,
      ),
      child: Builder(builder: (BuildContext context) {
        return DocumentScanWidget(
          scan: scan,
          onTap: onTap,
          onClose: onClose,
          onShareFile: onShareFile,
          onShareQr: onShareQr,
        );
      }),
    );
  }
}
