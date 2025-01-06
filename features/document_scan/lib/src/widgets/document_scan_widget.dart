import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'download_status_widget.dart';

class DocumentScanWidget extends StatelessWidget {
  final ScanEntryModel scan;
  final VoidCallback onTap;
  final VoidCallback onClose;
  final VoidCallback onShareFile;
  final Function(Uint8List qrCodeBites) onShareQr;

  const DocumentScanWidget({
    super.key,
    required this.scan,
    required this.onTap,
    required this.onClose,
    required this.onShareFile,
    required this.onShareQr,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(Icons.tag),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DownLoadStatusWidget(
            scan: scan,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return ShareScanDialog(
                      onShareQr: onShareQr,
                      onClose: onClose,
                      onShareFile: onShareFile,
                      remoteUrl: scan.remotePath,
                    );
                  });
            },
          ),
        ],
      ),
      title: Text(
        PdfService.getFileNameByPath(scan.localPath),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
