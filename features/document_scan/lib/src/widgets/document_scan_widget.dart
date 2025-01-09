import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/document_scan_bloc.dart';
import 'download_status_widget.dart';

class DocumentScanWidget extends StatelessWidget {
  final ScanEntryModel scan;
  final VoidCallback onClose;
  final VoidCallback onShareFile;
  final Function(Uint8List qrCodeBites) onShareQr;

  const DocumentScanWidget({
    super.key,
    required this.scan,
    required this.onClose,
    required this.onShareFile,
    required this.onShareQr,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DocumentScanBloc>().add(
              OpenScanEvent(scan: scan),
            );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/file.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                PdfService.getFileNameByPath(scan.localPath),
                overflow: TextOverflow.ellipsis,
                style: AppFonts.headingH5,
              ),
            ),
            DownLoadStatusWidget(
              scan: scan,
            ),
            const SizedBox(width: 16),
            GestureDetector(
              child: Icon(
                Icons.share,
                size: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {
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
            )
          ],
        ),
      ),
    );
  }
}
