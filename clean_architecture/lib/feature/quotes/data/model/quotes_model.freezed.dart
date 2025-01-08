// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
mixin _$QuotesModel {
  @JsonKey(name: 'quotes')
  List<ListOfQuotes> get quotes => throw _privateConstructorUsedError;

  /// Serializes this QuotesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res, QuotesModel>;
  @useResult
  $Res call({@JsonKey(name: 'quotes') List<ListOfQuotes> quotes});
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res, $Val extends QuotesModel>
    implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuotesModel
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
abstract class _$$QuotesModelImplCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$$QuotesModelImplCopyWith(
          _$QuotesModelImpl value, $Res Function(_$QuotesModelImpl) then) =
      __$$QuotesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'quotes') List<ListOfQuotes> quotes});
}

/// @nodoc
class __$$QuotesModelImplCopyWithImpl<$Res>
    extends _$QuotesModelCopyWithImpl<$Res, _$QuotesModelImpl>
    implements _$$QuotesModelImplCopyWith<$Res> {
  __$$QuotesModelImplCopyWithImpl(
      _$QuotesModelImpl _value, $Res Function(_$QuotesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = null,
  }) {
    return _then(_$QuotesModelImpl(
      quotes: null == quotes
          ? _value._quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<ListOfQuotes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuotesModelImpl extends _QuotesModel {
  const _$QuotesModelImpl(
      {@JsonKey(name: 'quotes') required final List<ListOfQuotes> quotes})
      : _quotes = quotes,
        super._();

  factory _$QuotesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotesModelImplFromJson(json);

  final List<ListOfQuotes> _quotes;
  @override
  @JsonKey(name: 'quotes')
  List<ListOfQuotes> get quotes {
    if (_quotes is EqualUnmodifiableListView) return _quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quotes);
  }

  @override
  String toString() {
    return 'QuotesModel(quotes: $quotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotesModelImpl &&
            const DeepCollectionEquality().equals(other._quotes, _quotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quotes));

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      __$$QuotesModelImplCopyWithImpl<_$QuotesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotesModelImplToJson(
      this,
    );
  }
}

abstract class _QuotesModel extends QuotesModel {
  const factory _QuotesModel(
          {@JsonKey(name: 'quotes') required final List<ListOfQuotes> quotes}) =
      _$QuotesModelImpl;
  const _QuotesModel._() : super._();

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$QuotesModelImpl.fromJson;

  @override
  @JsonKey(name: 'quotes')
  List<ListOfQuotes> get quotes;

  /// Create a copy of QuotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotesModelImplCopyWith<_$QuotesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListOfQuotes _$ListOfQuotesFromJson(Map<String, dynamic> json) {
  return _ListOfQuotes.fromJson(json);
}

/// @nodoc
mixin _$ListOfQuotes {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote')
  String? get quote => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;

  /// Serializes this ListOfQuotes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListOfQuotes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListOfQuotesCopyWith<ListOfQuotes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfQuotesCopyWith<$Res> {
  factory $ListOfQuotesCopyWith(
          ListOfQuotes value, $Res Function(ListOfQuotes) then) =
      _$ListOfQuotesCopyWithImpl<$Res, ListOfQuotes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'quote') String? quote,
      @JsonKey(name: 'author') String? author});
}

/// @nodoc
class _$ListOfQuotesCopyWithImpl<$Res, $Val extends ListOfQuotes>
    implements $ListOfQuotesCopyWith<$Res> {
  _$ListOfQuotesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListOfQuotes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quote = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOfQuotesImplCopyWith<$Res>
    implements $ListOfQuotesCopyWith<$Res> {
  factory _$$ListOfQuotesImplCopyWith(
          _$ListOfQuotesImpl value, $Res Function(_$ListOfQuotesImpl) then) =
      __$$ListOfQuotesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'quote') String? quote,
      @JsonKey(name: 'author') String? author});
}

/// @nodoc
class __$$ListOfQuotesImplCopyWithImpl<$Res>
    extends _$ListOfQuotesCopyWithImpl<$Res, _$ListOfQuotesImpl>
    implements _$$ListOfQuotesImplCopyWith<$Res> {
  __$$ListOfQuotesImplCopyWithImpl(
      _$ListOfQuotesImpl _value, $Res Function(_$ListOfQuotesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListOfQuotes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quote = freezed,
    Object? author = freezed,
  }) {
    return _then(_$ListOfQuotesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOfQuotesImpl implements _ListOfQuotes {
  const _$ListOfQuotesImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'quote') required this.quote,
      @JsonKey(name: 'author') required this.author});

  factory _$ListOfQuotesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOfQuotesImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'quote')
  final String? quote;
  @override
  @JsonKey(name: 'author')
  final String? author;

  @override
  String toString() {
    return 'ListOfQuotes(id: $id, quote: $quote, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfQuotesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quote, author);

  /// Create a copy of ListOfQuotes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfQuotesImplCopyWith<_$ListOfQuotesImpl> get copyWith =>
      __$$ListOfQuotesImplCopyWithImpl<_$ListOfQuotesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOfQuotesImplToJson(
      this,
    );
  }
}

abstract class _ListOfQuotes implements ListOfQuotes {
  const factory _ListOfQuotes(
          {@JsonKey(name: 'id') required final int? id,
          @JsonKey(name: 'quote') required final String? quote,
          @JsonKey(name: 'author') required final String? author}) =
      _$ListOfQuotesImpl;

  factory _ListOfQuotes.fromJson(Map<String, dynamic> json) =
      _$ListOfQuotesImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'quote')
  String? get quote;
  @override
  @JsonKey(name: 'author')
  String? get author;

  /// Create a copy of ListOfQuotes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListOfQuotesImplCopyWith<_$ListOfQuotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
