// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LineItemEntity _$LineItemEntityFromJson(Map<String, dynamic> json) {
  return _LineItemEntity.fromJson(json);
}

/// @nodoc
mixin _$LineItemEntity {
  String get description => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get unitPrice => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this LineItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LineItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LineItemEntityCopyWith<LineItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemEntityCopyWith<$Res> {
  factory $LineItemEntityCopyWith(
          LineItemEntity value, $Res Function(LineItemEntity) then) =
      _$LineItemEntityCopyWithImpl<$Res, LineItemEntity>;
  @useResult
  $Res call(
      {String description,
      String quantity,
      String unitPrice,
      String totalPrice});
}

/// @nodoc
class _$LineItemEntityCopyWithImpl<$Res, $Val extends LineItemEntity>
    implements $LineItemEntityCopyWith<$Res> {
  _$LineItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LineItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineItemEntityImplCopyWith<$Res>
    implements $LineItemEntityCopyWith<$Res> {
  factory _$$LineItemEntityImplCopyWith(_$LineItemEntityImpl value,
          $Res Function(_$LineItemEntityImpl) then) =
      __$$LineItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String quantity,
      String unitPrice,
      String totalPrice});
}

/// @nodoc
class __$$LineItemEntityImplCopyWithImpl<$Res>
    extends _$LineItemEntityCopyWithImpl<$Res, _$LineItemEntityImpl>
    implements _$$LineItemEntityImplCopyWith<$Res> {
  __$$LineItemEntityImplCopyWithImpl(
      _$LineItemEntityImpl _value, $Res Function(_$LineItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LineItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
  }) {
    return _then(_$LineItemEntityImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$LineItemEntityImpl implements _LineItemEntity {
  const _$LineItemEntityImpl(
      {required this.description,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice});

  factory _$LineItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineItemEntityImplFromJson(json);

  @override
  final String description;
  @override
  final String quantity;
  @override
  final String unitPrice;
  @override
  final String totalPrice;

  @override
  String toString() {
    return 'LineItemEntity(description: $description, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineItemEntityImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, quantity, unitPrice, totalPrice);

  /// Create a copy of LineItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LineItemEntityImplCopyWith<_$LineItemEntityImpl> get copyWith =>
      __$$LineItemEntityImplCopyWithImpl<_$LineItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineItemEntityImplToJson(
      this,
    );
  }
}

abstract class _LineItemEntity implements LineItemEntity {
  const factory _LineItemEntity(
      {required final String description,
      required final String quantity,
      required final String unitPrice,
      required final String totalPrice}) = _$LineItemEntityImpl;

  factory _LineItemEntity.fromJson(Map<String, dynamic> json) =
      _$LineItemEntityImpl.fromJson;

  @override
  String get description;
  @override
  String get quantity;
  @override
  String get unitPrice;
  @override
  String get totalPrice;

  /// Create a copy of LineItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LineItemEntityImplCopyWith<_$LineItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
