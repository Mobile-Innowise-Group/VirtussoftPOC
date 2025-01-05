import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ShareScanDialog extends StatefulWidget {
  final String remoteUrl;
  final Function(Uint8List qrCodeBites) onShare;
  final Function() onClose;

  const ShareScanDialog({
    Key? key,
    required this.onShare,
    required this.onClose,
    required this.remoteUrl,
  }) : super(key: key);

  @override
  _ShareScanDialogState createState() => _ShareScanDialogState();
}

class _ShareScanDialogState extends State<ShareScanDialog> {
  Uint8List? qrCodeBites;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Share qr code'),
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

          qrCodeBites = data;
          return Image.memory(data);
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: widget.onClose,
          child: Text('common.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: () {
            final Uint8List? bites = qrCodeBites;

            if (bites != null) {
              widget.onShare(bites);
            }
          },
          child: const Text('Share'),
        ),
      ],
    );
  }
}
