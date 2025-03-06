import 'dart:io';

class UploadPhotosRequest {
  final List<File> files;

  const UploadPhotosRequest({
    required this.files,
  });
}
