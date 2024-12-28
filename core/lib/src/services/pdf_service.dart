import 'dart:io';
import 'dart:typed_data';

import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfService {
  static Future<File> generateCenteredText(List<String> text) async {
    final Document pdf = Document();

    for (final String item in text) {
      pdf.addPage(
        Page(
          build: (Context context) {
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

  /// The method takes a file and transfers it to new path:
  /// {standardAppFolder}/[newFolderName]/{filename from [currentFilePath]}
  static Future<String> transferFile({
    required String currentFilePath,
    required String newFolderName,
  }) async {
    try {

      final File sourceFile = File(currentFilePath);
      if (!sourceFile.existsSync()) {
        throw Exception('No file founded');
      }

      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String newFolderPath = '${appDocDir.path}/$newFolderName';
      final Directory newFolder = Directory(newFolderPath);

      if (!newFolder.existsSync()) {
        await newFolder.create(recursive: true);
      }
      final String filename = path.basename(currentFilePath);
      final String newFilePath = '${newFolder.path}/$filename';
      await sourceFile.rename(newFilePath);

      return newFilePath;
    } catch (e) {
      rethrow;
    }
  }

  static String getFileNameByPath(String searchedPath) {
    return path.basename(searchedPath);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final Uint8List bytes = await pdf.save();

    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<void> openFile(File file) async {
    final String url = file.path;

    await OpenFile.open(url);
  }
}
