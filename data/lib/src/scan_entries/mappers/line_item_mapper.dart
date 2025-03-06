import 'package:domain/domain.dart';

import '../scan_entries.dart';

class LineItemMapper {
  static LineItemModel fromEntity(LineItemEntity entity) {
    return LineItemModel(
      description: entity.description,
      quantity: entity.quantity,
      unitPrice: entity.unitPrice,
      totalPrice: entity.totalPrice,
    );
  }

  static LineItemEntity toEntity(LineItemModel model) {
    return LineItemEntity(
      description: model.description,
      quantity: model.quantity,
      unitPrice: model.unitPrice,
      totalPrice: model.totalPrice,
    );
  }
}
