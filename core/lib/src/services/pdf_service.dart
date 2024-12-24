import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';

class PdfService {
  static Future<File> generateCenteredText(List<String> text) async {
    final pdf = Document();

    for (final item in text) {
      pdf.addPage(
        Page(
          build: (context) {
            return Text(
              item,
              style: const TextStyle(fontSize: 14),
            );
          },
        ),
      );
    }

    return saveDocument(name: 'virtussoft_${DateTime.now()}.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
