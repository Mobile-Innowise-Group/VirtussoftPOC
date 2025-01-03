import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrService {
  static Future<Uint8List> generateQRCode(String data) async {
    try {
      final QrValidationResult qrValidationResult = QrValidator.validate(
        data: data,
        version: QrVersions.min,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
      );

      if (qrValidationResult.status != QrValidationStatus.valid) {
        throw Exception('Invalid QR data');
      }

      final QrPainter painter = QrPainter(
        data: data,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
      );

      final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
      final ui.Canvas canvas = Canvas(pictureRecorder);

      const double size = 200.0;
      final Paint backgroundPaint = Paint()..color = const Color.fromRGBO(255, 255, 255, 1);
      canvas.drawRect(const Rect.fromLTWH(0, 0, size, size), backgroundPaint);
      painter.paint(canvas, const Size(size, size));

      final ui.Picture picture = pictureRecorder.endRecording();
      final ui.Image image = await picture.toImage(size.toInt(), size.toInt());

      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List bytes = byteData!.buffer.asUint8List();

      return bytes;
    } catch (e) {
      throw Exception('Error generating QR code: $e');
    }
  }
}
