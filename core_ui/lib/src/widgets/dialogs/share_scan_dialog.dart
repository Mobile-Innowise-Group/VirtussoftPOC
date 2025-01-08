import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class ShareScanDialog extends StatefulWidget {
  final String remoteUrl;
  final Function(Uint8List qrCodeBites) onShareQr;
  final Function() onShareFile;
  final Function() onClose;

  const ShareScanDialog({
    Key? key,
    required this.onShareQr,
    required this.onClose,
    required this.remoteUrl,
    required this.onShareFile,
  }) : super(key: key);

  @override
  _ShareScanDialogState createState() => _ShareScanDialogState();
}

class _ShareScanDialogState extends State<ShareScanDialog> {
  Uint8List? fileBites;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Share qr code',
        style: AppFonts.headingH3,
      ),
      content: FutureBuilder<Uint8List>(
        future: QrService.generateQRCode(widget.remoteUrl),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          final Uint8List? data = snapshot.data;

          if (data == null) {
            return const SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          fileBites = data;
          return Image.memory(data);
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: widget.onClose,
          child: Text('common.cancel'.tr()),
        ),
        TextButton(
          onPressed: widget.onShareFile,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Text(
            'Share file'.tr(),
            style: AppFonts.bodyM.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
