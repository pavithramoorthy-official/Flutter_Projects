// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuotesEntity _$QuotesEntityFromJson(Map<String, dynamic> json) {
  return _QuotesEntity.fromJson(json);
}

/// @nodoc
mixin _$QuotesEntity {
  List<ListOfQuotes> get quotes => throw _privateConstructorUsedError;

  /// Serializes this QuotesEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuotesEntityCopyWith<QuotesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesEntityCopyWith<$Res> {
  factory $QuotesEntityCopyWith(
          QuotesEntity value, $Res Function(QuotesEntity) then) =
      _$QuotesEntityCopyWithImpl<$Res, QuotesEntity>;
  @useResult
  $Res call({List<ListOfQuotes> quotes});
}

/// @nodoc
class _$QuotesEntityCopyWithImpl<$Res, $Val extends QuotesEntity>
    implements $QuotesEntityCopyWith<$Res> {
  _$QuotesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = null,
  }) {
    return _then(_value.copyWith(
      quotes: null == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<ListOfQuotes>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuotesEntityImplCopyWith<$Res>
    implements $QuotesEntityCopyWith<$Res> {
  factory _$$QuotesEntityImplCopyWith(
          _$QuotesEntityImpl value, $Res Function(_$QuotesEntityImpl) then) =
      __$$QuotesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ListOfQuotes> quotes});
}

/// @nodoc
class __$$QuotesEntityImplCopyWithImpl<$Res>
    extends _$QuotesEntityCopyWithImpl<$Res, _$QuotesEntityImpl>
    implements _$$QuotesEntityImplCopyWith<$Res> {
  __$$QuotesEntityImplCopyWithImpl(
      _$QuotesEntityImpl _value, $Res Function(_$QuotesEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = null,
  }) {
    return _then(_$QuotesEntityImpl(
      quotes: null == quotes
          ? _value._quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<ListOfQuotes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotesEntityImpl implements _QuotesEntity {
  const _$QuotesEntityImpl({required final List<ListOfQuotes> quotes})
      : _quotes = quotes;

  factory _$QuotesEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotesEntityImplFromJson(json);

  final List<ListOfQuotes> _quotes;
  @override
  List<ListOfQuotes> get quotes {
    if (_quotes is EqualUnmodifiableListView) return _quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quotes);
  }

  @override
  String toString() {
    return 'QuotesEntity(quotes: $quotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotesEntityImpl &&
            const DeepCollectionEquality().equals(other._quotes, _quotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quotes));

  /// Create a copy of QuotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotesEntityImplCopyWith<_$QuotesEntityImpl> get copyWith =>
      __$$QuotesEntityImplCopyWithImpl<_$QuotesEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotesEntityImplToJson(
      this,
    );
  }
}

abstract class _QuotesEntity implements QuotesEntity {
  const factory _QuotesEntity({required final List<ListOfQuotes> quotes}) =
      _$QuotesEntityImpl;

  factory _QuotesEntity.fromJson(Map<String, dynamic> json) =
      _$QuotesEntityImpl.fromJson;

  @override
  List<ListOfQuotes> get quotes;

  /// Create a copy of QuotesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotesEntityImplCopyWith<_$QuotesEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
