// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ad _$AdFromJson(Map<String, dynamic> json) {
  return _Ad.fromJson(json);
}

/// @nodoc
mixin _$Ad {
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int get v => throw _privateConstructorUsedError;

  /// Serializes this Ad to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdCopyWith<Ad> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdCopyWith<$Res> {
  factory $AdCopyWith(Ad value, $Res Function(Ad) then) =
      _$AdCopyWithImpl<$Res, Ad>;
  @useResult
  $Res call(
      {@JsonKey(name: "image") String image,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "__v") int v});
}

/// @nodoc
class _$AdCopyWithImpl<$Res, $Val extends Ad> implements $AdCopyWith<$Res> {
  _$AdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? type = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdImplCopyWith<$Res> implements $AdCopyWith<$Res> {
  factory _$$AdImplCopyWith(_$AdImpl value, $Res Function(_$AdImpl) then) =
      __$$AdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "image") String image,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "__v") int v});
}

/// @nodoc
class __$$AdImplCopyWithImpl<$Res> extends _$AdCopyWithImpl<$Res, _$AdImpl>
    implements _$$AdImplCopyWith<$Res> {
  __$$AdImplCopyWithImpl(_$AdImpl _value, $Res Function(_$AdImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? type = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
  }) {
    return _then(_$AdImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdImpl implements _Ad {
  const _$AdImpl(
      {@JsonKey(name: "image") required this.image,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      @JsonKey(name: "__v") required this.v});

  factory _$AdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdImplFromJson(json);

  @override
  @JsonKey(name: "image")
  final String image;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "__v")
  final int v;

  @override
  String toString() {
    return 'Ad(image: $image, type: $type, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, type, id, createdAt, updatedAt, v);

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      __$$AdImplCopyWithImpl<_$AdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdImplToJson(
      this,
    );
  }
}

abstract class _Ad implements Ad {
  const factory _Ad(
      {@JsonKey(name: "image") required final String image,
      @JsonKey(name: "type") required final String type,
      @JsonKey(name: "_id") required final String id,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      @JsonKey(name: "__v") required final int v}) = _$AdImpl;

  factory _Ad.fromJson(Map<String, dynamic> json) = _$AdImpl.fromJson;

  @override
  @JsonKey(name: "image")
  String get image;
  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "__v")
  int get v;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "details")
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "childService")
  List<Service> get childService => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int get v => throw _privateConstructorUsedError;

  /// Serializes this Service to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "details") String details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "childService") List<Service> childService,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "__v") int v});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? details = null,
    Object? id = null,
    Object? price = null,
    Object? isActive = null,
    Object? childService = null,
    Object? image = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      childService: null == childService
          ? _value.childService
          : childService // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "details") String details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "childService") List<Service> childService,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "__v") int v});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? details = null,
    Object? id = null,
    Object? price = null,
    Object? isActive = null,
    Object? childService = null,
    Object? image = null,
    Object? v = null,
  }) {
    return _then(_$ServiceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      childService: null == childService
          ? _value._childService
          : childService // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "details") required this.details,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "is_active") required this.isActive,
      @JsonKey(name: "childService") required final List<Service> childService,
      @JsonKey(name: "image") required this.image,
      @JsonKey(name: "__v") required this.v})
      : _childService = childService;

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "details")
  final String details;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "price")
  final int price;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  final List<Service> _childService;
  @override
  @JsonKey(name: "childService")
  List<Service> get childService {
    if (_childService is EqualUnmodifiableListView) return _childService;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childService);
  }

  @override
  @JsonKey(name: "image")
  final String image;
  @override
  @JsonKey(name: "__v")
  final int v;

  @override
  String toString() {
    return 'Service(name: $name, details: $details, id: $id, price: $price, isActive: $isActive, childService: $childService, image: $image, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._childService, _childService) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, details, id, price,
      isActive, const DeepCollectionEquality().hash(_childService), image, v);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {@JsonKey(name: "name") required final String name,
      @JsonKey(name: "details") required final String details,
      @JsonKey(name: "_id") required final String id,
      @JsonKey(name: "price") required final int price,
      @JsonKey(name: "is_active") required final bool isActive,
      @JsonKey(name: "childService") required final List<Service> childService,
      @JsonKey(name: "image") required final String image,
      @JsonKey(name: "__v") required final int v}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "details")
  String get details;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "price")
  int get price;
  @override
  @JsonKey(name: "is_active")
  bool get isActive;
  @override
  @JsonKey(name: "childService")
  List<Service> get childService;
  @override
  @JsonKey(name: "image")
  String get image;
  @override
  @JsonKey(name: "__v")
  int get v;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
