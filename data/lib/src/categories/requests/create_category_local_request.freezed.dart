// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_category_local_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCategoryLocalRequest _$CreateCategoryLocalRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateCategoryLocalRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateCategoryLocalRequest {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this CreateCategoryLocalRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCategoryLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCategoryLocalRequestCopyWith<CreateCategoryLocalRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCategoryLocalRequestCopyWith<$Res> {
  factory $CreateCategoryLocalRequestCopyWith(CreateCategoryLocalRequest value,
          $Res Function(CreateCategoryLocalRequest) then) =
      _$CreateCategoryLocalRequestCopyWithImpl<$Res,
          CreateCategoryLocalRequest>;
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class _$CreateCategoryLocalRequestCopyWithImpl<$Res,
        $Val extends CreateCategoryLocalRequest>
    implements $CreateCategoryLocalRequestCopyWith<$Res> {
  _$CreateCategoryLocalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCategoryLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCategoryLocalRequestImplCopyWith<$Res>
    implements $CreateCategoryLocalRequestCopyWith<$Res> {
  factory _$$CreateCategoryLocalRequestImplCopyWith(
          _$CreateCategoryLocalRequestImpl value,
          $Res Function(_$CreateCategoryLocalRequestImpl) then) =
      __$$CreateCategoryLocalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class __$$CreateCategoryLocalRequestImplCopyWithImpl<$Res>
    extends _$CreateCategoryLocalRequestCopyWithImpl<$Res,
        _$CreateCategoryLocalRequestImpl>
    implements _$$CreateCategoryLocalRequestImplCopyWith<$Res> {
  __$$CreateCategoryLocalRequestImplCopyWithImpl(
      _$CreateCategoryLocalRequestImpl _value,
      $Res Function(_$CreateCategoryLocalRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCategoryLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$CreateCategoryLocalRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCategoryLocalRequestImpl implements _CreateCategoryLocalRequest {
  const _$CreateCategoryLocalRequestImpl(
      {required this.name, required this.id});

  factory _$CreateCategoryLocalRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateCategoryLocalRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'CreateCategoryLocalRequest(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCategoryLocalRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  /// Create a copy of CreateCategoryLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCategoryLocalRequestImplCopyWith<_$CreateCategoryLocalRequestImpl>
      get copyWith => __$$CreateCategoryLocalRequestImplCopyWithImpl<
          _$CreateCategoryLocalRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCategoryLocalRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateCategoryLocalRequest
    implements CreateCategoryLocalRequest {
  const factory _CreateCategoryLocalRequest(
      {required final String name,
      required final String id}) = _$CreateCategoryLocalRequestImpl;

  factory _CreateCategoryLocalRequest.fromJson(Map<String, dynamic> json) =
      _$CreateCategoryLocalRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get id;

  /// Create a copy of CreateCategoryLocalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCategoryLocalRequestImplCopyWith<_$CreateCategoryLocalRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
