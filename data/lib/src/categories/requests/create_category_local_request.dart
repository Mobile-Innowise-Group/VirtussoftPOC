import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_local_request.freezed.dart';

part 'create_category_local_request.g.dart';

@freezed
class CreateCategoryLocalRequest with _$CreateCategoryLocalRequest {
  const factory CreateCategoryLocalRequest({
    required String name,
    required String id,
  }) = _CreateCategoryLocalRequest;

  factory CreateCategoryLocalRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryLocalRequestFromJson(json);
}
