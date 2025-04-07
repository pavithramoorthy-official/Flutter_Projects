// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

bill _$billFromJson(Map<String, dynamic> json) {
  return _bill.fromJson(json);
}

/// @nodoc
mixin _$bill {
  List<billData> get data => throw _privateConstructorUsedError;

  /// Serializes this bill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of bill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $billCopyWith<bill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $billCopyWith<$Res> {
  factory $billCopyWith(bill value, $Res Function(bill) then) =
      _$billCopyWithImpl<$Res, bill>;
  @useResult
  $Res call({List<billData> data});
}

/// @nodoc
class _$billCopyWithImpl<$Res, $Val extends bill>
    implements $billCopyWith<$Res> {
  _$billCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of bill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<billData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$billImplCopyWith<$Res> implements $billCopyWith<$Res> {
  factory _$$billImplCopyWith(
          _$billImpl value, $Res Function(_$billImpl) then) =
      __$$billImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<billData> data});
}

/// @nodoc
class __$$billImplCopyWithImpl<$Res>
    extends _$billCopyWithImpl<$Res, _$billImpl>
    implements _$$billImplCopyWith<$Res> {
  __$$billImplCopyWithImpl(_$billImpl _value, $Res Function(_$billImpl) _then)
      : super(_value, _then);

  /// Create a copy of bill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$billImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<billData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$billImpl with DiagnosticableTreeMixin implements _bill {
  const _$billImpl({required final List<billData> data}) : _data = data;

  factory _$billImpl.fromJson(Map<String, dynamic> json) =>
      _$$billImplFromJson(json);

  final List<billData> _data;
  @override
  List<billData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'bill(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'bill'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$billImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of bill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$billImplCopyWith<_$billImpl> get copyWith =>
      __$$billImplCopyWithImpl<_$billImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$billImplToJson(
      this,
    );
  }
}

abstract class _bill implements bill {
  const factory _bill({required final List<billData> data}) = _$billImpl;

  factory _bill.fromJson(Map<String, dynamic> json) = _$billImpl.fromJson;

  @override
  List<billData> get data;

  /// Create a copy of bill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$billImplCopyWith<_$billImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

billData _$billDataFromJson(Map<String, dynamic> json) {
  return _billData.fromJson(json);
}

/// @nodoc
mixin _$billData {
  String? get billNumber => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<ItemList> get items => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this billData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of billData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $billDataCopyWith<billData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $billDataCopyWith<$Res> {
  factory $billDataCopyWith(billData value, $Res Function(billData) then) =
      _$billDataCopyWithImpl<$Res, billData>;
  @useResult
  $Res call(
      {String? billNumber,
      String location,
      List<ItemList> items,
      double totalAmount,
      String date});
}

/// @nodoc
class _$billDataCopyWithImpl<$Res, $Val extends billData>
    implements $billDataCopyWith<$Res> {
  _$billDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of billData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billNumber = freezed,
    Object? location = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      billNumber: freezed == billNumber
          ? _value.billNumber
          : billNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemList>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$billDataImplCopyWith<$Res>
    implements $billDataCopyWith<$Res> {
  factory _$$billDataImplCopyWith(
          _$billDataImpl value, $Res Function(_$billDataImpl) then) =
      __$$billDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? billNumber,
      String location,
      List<ItemList> items,
      double totalAmount,
      String date});
}

/// @nodoc
class __$$billDataImplCopyWithImpl<$Res>
    extends _$billDataCopyWithImpl<$Res, _$billDataImpl>
    implements _$$billDataImplCopyWith<$Res> {
  __$$billDataImplCopyWithImpl(
      _$billDataImpl _value, $Res Function(_$billDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of billData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billNumber = freezed,
    Object? location = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? date = null,
  }) {
    return _then(_$billDataImpl(
      billNumber: freezed == billNumber
          ? _value.billNumber
          : billNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemList>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$billDataImpl with DiagnosticableTreeMixin implements _billData {
  const _$billDataImpl(
      {required this.billNumber,
      required this.location,
      required final List<ItemList> items,
      required this.totalAmount,
      required this.date})
      : _items = items;

  factory _$billDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$billDataImplFromJson(json);

  @override
  final String? billNumber;
  @override
  final String location;
  final List<ItemList> _items;
  @override
  List<ItemList> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double totalAmount;
  @override
  final String date;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'billData(billNumber: $billNumber, location: $location, items: $items, totalAmount: $totalAmount, date: $date)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'billData'))
      ..add(DiagnosticsProperty('billNumber', billNumber))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('date', date));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$billDataImpl &&
            (identical(other.billNumber, billNumber) ||
                other.billNumber == billNumber) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, billNumber, location,
      const DeepCollectionEquality().hash(_items), totalAmount, date);

  /// Create a copy of billData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$billDataImplCopyWith<_$billDataImpl> get copyWith =>
      __$$billDataImplCopyWithImpl<_$billDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$billDataImplToJson(
      this,
    );
  }
}

abstract class _billData implements billData {
  const factory _billData(
      {required final String? billNumber,
      required final String location,
      required final List<ItemList> items,
      required final double totalAmount,
      required final String date}) = _$billDataImpl;

  factory _billData.fromJson(Map<String, dynamic> json) =
      _$billDataImpl.fromJson;

  @override
  String? get billNumber;
  @override
  String get location;
  @override
  List<ItemList> get items;
  @override
  double get totalAmount;
  @override
  String get date;

  /// Create a copy of billData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$billDataImplCopyWith<_$billDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return _ItemList.fromJson(json);
}

/// @nodoc
mixin _$ItemList {
  String get item_name => throw _privateConstructorUsedError;
  int get item_quantity => throw _privateConstructorUsedError;
  double get item_total => throw _privateConstructorUsedError;
  double get item_gst => throw _privateConstructorUsedError;
  double get item_price => throw _privateConstructorUsedError;

  /// Serializes this ItemList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemListCopyWith<ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListCopyWith<$Res> {
  factory $ItemListCopyWith(ItemList value, $Res Function(ItemList) then) =
      _$ItemListCopyWithImpl<$Res, ItemList>;
  @useResult
  $Res call(
      {String item_name,
      int item_quantity,
      double item_total,
      double item_gst,
      double item_price});
}

/// @nodoc
class _$ItemListCopyWithImpl<$Res, $Val extends ItemList>
    implements $ItemListCopyWith<$Res> {
  _$ItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_name = null,
    Object? item_quantity = null,
    Object? item_total = null,
    Object? item_gst = null,
    Object? item_price = null,
  }) {
    return _then(_value.copyWith(
      item_name: null == item_name
          ? _value.item_name
          : item_name // ignore: cast_nullable_to_non_nullable
              as String,
      item_quantity: null == item_quantity
          ? _value.item_quantity
          : item_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      item_total: null == item_total
          ? _value.item_total
          : item_total // ignore: cast_nullable_to_non_nullable
              as double,
      item_gst: null == item_gst
          ? _value.item_gst
          : item_gst // ignore: cast_nullable_to_non_nullable
              as double,
      item_price: null == item_price
          ? _value.item_price
          : item_price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemListImplCopyWith<$Res>
    implements $ItemListCopyWith<$Res> {
  factory _$$ItemListImplCopyWith(
          _$ItemListImpl value, $Res Function(_$ItemListImpl) then) =
      __$$ItemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String item_name,
      int item_quantity,
      double item_total,
      double item_gst,
      double item_price});
}

/// @nodoc
class __$$ItemListImplCopyWithImpl<$Res>
    extends _$ItemListCopyWithImpl<$Res, _$ItemListImpl>
    implements _$$ItemListImplCopyWith<$Res> {
  __$$ItemListImplCopyWithImpl(
      _$ItemListImpl _value, $Res Function(_$ItemListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_name = null,
    Object? item_quantity = null,
    Object? item_total = null,
    Object? item_gst = null,
    Object? item_price = null,
  }) {
    return _then(_$ItemListImpl(
      item_name: null == item_name
          ? _value.item_name
          : item_name // ignore: cast_nullable_to_non_nullable
              as String,
      item_quantity: null == item_quantity
          ? _value.item_quantity
          : item_quantity // ignore: cast_nullable_to_non_nullable
              as int,
      item_total: null == item_total
          ? _value.item_total
          : item_total // ignore: cast_nullable_to_non_nullable
              as double,
      item_gst: null == item_gst
          ? _value.item_gst
          : item_gst // ignore: cast_nullable_to_non_nullable
              as double,
      item_price: null == item_price
          ? _value.item_price
          : item_price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemListImpl with DiagnosticableTreeMixin implements _ItemList {
  const _$ItemListImpl(
      {required this.item_name,
      required this.item_quantity,
      required this.item_total,
      required this.item_gst,
      required this.item_price});

  factory _$ItemListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemListImplFromJson(json);

  @override
  final String item_name;
  @override
  final int item_quantity;
  @override
  final double item_total;
  @override
  final double item_gst;
  @override
  final double item_price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemList(item_name: $item_name, item_quantity: $item_quantity, item_total: $item_total, item_gst: $item_gst, item_price: $item_price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemList'))
      ..add(DiagnosticsProperty('item_name', item_name))
      ..add(DiagnosticsProperty('item_quantity', item_quantity))
      ..add(DiagnosticsProperty('item_total', item_total))
      ..add(DiagnosticsProperty('item_gst', item_gst))
      ..add(DiagnosticsProperty('item_price', item_price));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemListImpl &&
            (identical(other.item_name, item_name) ||
                other.item_name == item_name) &&
            (identical(other.item_quantity, item_quantity) ||
                other.item_quantity == item_quantity) &&
            (identical(other.item_total, item_total) ||
                other.item_total == item_total) &&
            (identical(other.item_gst, item_gst) ||
                other.item_gst == item_gst) &&
            (identical(other.item_price, item_price) ||
                other.item_price == item_price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, item_name, item_quantity, item_total, item_gst, item_price);

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListImplCopyWith<_$ItemListImpl> get copyWith =>
      __$$ItemListImplCopyWithImpl<_$ItemListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemListImplToJson(
      this,
    );
  }
}

abstract class _ItemList implements ItemList {
  const factory _ItemList(
      {required final String item_name,
      required final int item_quantity,
      required final double item_total,
      required final double item_gst,
      required final double item_price}) = _$ItemListImpl;

  factory _ItemList.fromJson(Map<String, dynamic> json) =
      _$ItemListImpl.fromJson;

  @override
  String get item_name;
  @override
  int get item_quantity;
  @override
  double get item_total;
  @override
  double get item_gst;
  @override
  double get item_price;

  /// Create a copy of ItemList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemListImplCopyWith<_$ItemListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
