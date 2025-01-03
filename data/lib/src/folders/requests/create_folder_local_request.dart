import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_folder_local_request.freezed.dart';

part 'create_folder_local_request.g.dart';

@freezed
class CreateFolderLocalRequest with _$CreateFolderLocalRequest {
  const factory CreateFolderLocalRequest({
    required String name,
    required int isPrivate,
    required String id,
  }) = _CreateFolderLocalRequest;

  factory CreateFolderLocalRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFolderLocalRequestFromJson(json);
}
