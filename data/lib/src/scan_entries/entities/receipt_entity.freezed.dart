// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptEntity _$ReceiptEntityFromJson(Map<String, dynamic> json) {
  return _ReceiptEntity.fromJson(json);
}

/// @nodoc
mixin _$ReceiptEntity {
  String get vendorName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get receiptNumber => throw _privateConstructorUsedError;
  String get receiptDate => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get taxNumber => throw _privateConstructorUsedError;
  List<LineItemEntity> get lineItems => throw _privateConstructorUsedError;

  /// Serializes this ReceiptEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptEntityCopyWith<ReceiptEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptEntityCopyWith<$Res> {
  factory $ReceiptEntityCopyWith(
          ReceiptEntity value, $Res Function(ReceiptEntity) then) =
      _$ReceiptEntityCopyWithImpl<$Res, ReceiptEntity>;
  @useResult
  $Res call(
      {String vendorName,
      String address,
      String receiptNumber,
      String receiptDate,
      String totalAmount,
      String currency,
      String paymentMethod,
      String taxNumber,
      List<LineItemEntity> lineItems});
}

/// @nodoc
class _$ReceiptEntityCopyWithImpl<$Res, $Val extends ReceiptEntity>
    implements $ReceiptEntityCopyWith<$Res> {
  _$ReceiptEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorName = null,
    Object? address = null,
    Object? receiptNumber = null,
    Object? receiptDate = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? taxNumber = null,
    Object? lineItems = null,
  }) {
    return _then(_value.copyWith(
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNumber: null == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      receiptDate: null == receiptDate
          ? _value.receiptDate
          : receiptDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      taxNumber: null == taxNumber
          ? _value.taxNumber
          : taxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineItems: null == lineItems
          ? _value.lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptEntityImplCopyWith<$Res>
    implements $ReceiptEntityCopyWith<$Res> {
  factory _$$ReceiptEntityImplCopyWith(
          _$ReceiptEntityImpl value, $Res Function(_$ReceiptEntityImpl) then) =
      __$$ReceiptEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vendorName,
      String address,
      String receiptNumber,
      String receiptDate,
      String totalAmount,
      String currency,
      String paymentMethod,
      String taxNumber,
      List<LineItemEntity> lineItems});
}

/// @nodoc
class __$$ReceiptEntityImplCopyWithImpl<$Res>
    extends _$ReceiptEntityCopyWithImpl<$Res, _$ReceiptEntityImpl>
    implements _$$ReceiptEntityImplCopyWith<$Res> {
  __$$ReceiptEntityImplCopyWithImpl(
      _$ReceiptEntityImpl _value, $Res Function(_$ReceiptEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorName = null,
    Object? address = null,
    Object? receiptNumber = null,
    Object? receiptDate = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? taxNumber = null,
    Object? lineItems = null,
  }) {
    return _then(_$ReceiptEntityImpl(
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNumber: null == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      receiptDate: null == receiptDate
          ? _value.receiptDate
          : receiptDate // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      taxNumber: null == taxNumber
          ? _value.taxNumber
          : taxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineItems: null == lineItems
          ? _value._lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItemEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _$ReceiptEntityImpl implements _ReceiptEntity {
  const _$ReceiptEntityImpl(
      {required this.vendorName,
      required this.address,
      required this.receiptNumber,
      required this.receiptDate,
      required this.totalAmount,
      required this.currency,
      required this.paymentMethod,
      required this.taxNumber,
      required final List<LineItemEntity> lineItems})
      : _lineItems = lineItems;

  factory _$ReceiptEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptEntityImplFromJson(json);

  @override
  final String vendorName;
  @override
  final String address;
  @override
  final String receiptNumber;
  @override
  final String receiptDate;
  @override
  final String totalAmount;
  @override
  final String currency;
  @override
  final String paymentMethod;
  @override
  final String taxNumber;
  final List<LineItemEntity> _lineItems;
  @override
  List<LineItemEntity> get lineItems {
    if (_lineItems is EqualUnmodifiableListView) return _lineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineItems);
  }

  @override
  String toString() {
    return 'ReceiptEntity(vendorName: $vendorName, address: $address, receiptNumber: $receiptNumber, receiptDate: $receiptDate, totalAmount: $totalAmount, currency: $currency, paymentMethod: $paymentMethod, taxNumber: $taxNumber, lineItems: $lineItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptEntityImpl &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.receiptDate, receiptDate) ||
                other.receiptDate == receiptDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.taxNumber, taxNumber) ||
                other.taxNumber == taxNumber) &&
            const DeepCollectionEquality()
                .equals(other._lineItems, _lineItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vendorName,
      address,
      receiptNumber,
      receiptDate,
      totalAmount,
      currency,
      paymentMethod,
      taxNumber,
      const DeepCollectionEquality().hash(_lineItems));

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptEntityImplCopyWith<_$ReceiptEntityImpl> get copyWith =>
      __$$ReceiptEntityImplCopyWithImpl<_$ReceiptEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptEntityImplToJson(
      this,
    );
  }
}

abstract class _ReceiptEntity implements ReceiptEntity {
  const factory _ReceiptEntity(
      {required final String vendorName,
      required final String address,
      required final String receiptNumber,
      required final String receiptDate,
      required final String totalAmount,
      required final String currency,
      required final String paymentMethod,
      required final String taxNumber,
      required final List<LineItemEntity> lineItems}) = _$ReceiptEntityImpl;

  factory _ReceiptEntity.fromJson(Map<String, dynamic> json) =
      _$ReceiptEntityImpl.fromJson;

  @override
  String get vendorName;
  @override
  String get address;
  @override
  String get receiptNumber;
  @override
  String get receiptDate;
  @override
  String get totalAmount;
  @override
  String get currency;
  @override
  String get paymentMethod;
  @override
  String get taxNumber;
  @override
  List<LineItemEntity> get lineItems;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptEntityImplCopyWith<_$ReceiptEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
