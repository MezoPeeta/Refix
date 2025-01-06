// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
mixin _$Point {
  @JsonKey(name: "name")
  Localized get name => throw _privateConstructorUsedError;
  @JsonKey(name: "details")
  Localized? get details => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "percentage")
  int get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: "required_points")
  int get requiredPoints => throw _privateConstructorUsedError;
  @JsonKey(name: "available_days")
  int get availableDays => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Point to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") Localized name,
      @JsonKey(name: "details") Localized? details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "percentage") int percentage,
      @JsonKey(name: "required_points") int requiredPoints,
      @JsonKey(name: "available_days") int availableDays,
      @JsonKey(name: "active") bool active,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  $LocalizedCopyWith<$Res> get name;
  $LocalizedCopyWith<$Res>? get details;
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? details = freezed,
    Object? id = null,
    Object? percentage = null,
    Object? requiredPoints = null,
    Object? availableDays = null,
    Object? active = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Localized,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      requiredPoints: null == requiredPoints
          ? _value.requiredPoints
          : requiredPoints // ignore: cast_nullable_to_non_nullable
              as int,
      availableDays: null == availableDays
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res> get name {
    return $LocalizedCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $LocalizedCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") Localized name,
      @JsonKey(name: "details") Localized? details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "percentage") int percentage,
      @JsonKey(name: "required_points") int requiredPoints,
      @JsonKey(name: "available_days") int availableDays,
      @JsonKey(name: "active") bool active,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  @override
  $LocalizedCopyWith<$Res> get name;
  @override
  $LocalizedCopyWith<$Res>? get details;
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? details = freezed,
    Object? id = null,
    Object? percentage = null,
    Object? requiredPoints = null,
    Object? availableDays = null,
    Object? active = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PointImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Localized,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      requiredPoints: null == requiredPoints
          ? _value.requiredPoints
          : requiredPoints // ignore: cast_nullable_to_non_nullable
              as int,
      availableDays: null == availableDays
          ? _value.availableDays
          : availableDays // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointImpl implements _Point {
  const _$PointImpl(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "details") this.details,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "percentage") required this.percentage,
      @JsonKey(name: "required_points") required this.requiredPoints,
      @JsonKey(name: "available_days") required this.availableDays,
      @JsonKey(name: "active") required this.active,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt});

  factory _$PointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final Localized name;
  @override
  @JsonKey(name: "details")
  final Localized? details;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "percentage")
  final int percentage;
  @override
  @JsonKey(name: "required_points")
  final int requiredPoints;
  @override
  @JsonKey(name: "available_days")
  final int availableDays;
  @override
  @JsonKey(name: "active")
  final bool active;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Point(name: $name, details: $details, id: $id, percentage: $percentage, requiredPoints: $requiredPoints, availableDays: $availableDays, active: $active, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.requiredPoints, requiredPoints) ||
                other.requiredPoints == requiredPoints) &&
            (identical(other.availableDays, availableDays) ||
                other.availableDays == availableDays) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, details, id, percentage,
      requiredPoints, availableDays, active, createdAt, updatedAt);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointImplToJson(
      this,
    );
  }
}

abstract class _Point implements Point {
  const factory _Point(
          {@JsonKey(name: "name") required final Localized name,
          @JsonKey(name: "details") final Localized? details,
          @JsonKey(name: "_id") required final String id,
          @JsonKey(name: "percentage") required final int percentage,
          @JsonKey(name: "required_points") required final int requiredPoints,
          @JsonKey(name: "available_days") required final int availableDays,
          @JsonKey(name: "active") required final bool active,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$PointImpl;

  factory _Point.fromJson(Map<String, dynamic> json) = _$PointImpl.fromJson;

  @override
  @JsonKey(name: "name")
  Localized get name;
  @override
  @JsonKey(name: "details")
  Localized? get details;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "percentage")
  int get percentage;
  @override
  @JsonKey(name: "required_points")
  int get requiredPoints;
  @override
  @JsonKey(name: "available_days")
  int get availableDays;
  @override
  @JsonKey(name: "active")
  bool get active;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
