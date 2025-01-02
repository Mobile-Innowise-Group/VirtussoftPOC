import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareFile({
    required String message,
    required Uint8List bites,
  }) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final File file = File('${tempDir.path}/qr_code.png');

      await file.writeAsBytes(bites);

      await Share.shareXFiles(
        <XFile>[
          XFile(file.path),
        ],
        text: message,
      );
    } catch (e) {
      throw Exception('Error sharing QR Code: $e');
    }
  }
}
