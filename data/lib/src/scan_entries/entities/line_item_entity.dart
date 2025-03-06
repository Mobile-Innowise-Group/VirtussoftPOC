import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_item_entity.freezed.dart';
part 'line_item_entity.g.dart';

@freezed
class LineItemEntity with _$LineItemEntity {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory LineItemEntity({
    required String description,
    required String quantity,
    required String unitPrice,
    required String totalPrice,
  }) = _LineItemEntity;

  factory LineItemEntity.fromJson(Map<String, dynamic> json) => _$LineItemEntityFromJson(json);
}
