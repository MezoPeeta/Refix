// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return _Reviews.fromJson(json);
}

/// @nodoc
mixin _$Reviews {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  BookingElement get booking => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Reviews to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewsCopyWith<Reviews> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsCopyWith<$Res> {
  factory $ReviewsCopyWith(Reviews value, $Res Function(Reviews) then) =
      _$ReviewsCopyWithImpl<$Res, Reviews>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      int rating,
      BookingElement booking,
      DateTime createdAt});

  $BookingElementCopyWith<$Res> get booking;
}

/// @nodoc
class _$ReviewsCopyWithImpl<$Res, $Val extends Reviews>
    implements $ReviewsCopyWith<$Res> {
  _$ReviewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? booking = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      booking: null == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as BookingElement,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingElementCopyWith<$Res> get booking {
    return $BookingElementCopyWith<$Res>(_value.booking, (value) {
      return _then(_value.copyWith(booking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewsImplCopyWith<$Res> implements $ReviewsCopyWith<$Res> {
  factory _$$ReviewsImplCopyWith(
          _$ReviewsImpl value, $Res Function(_$ReviewsImpl) then) =
      __$$ReviewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      int rating,
      BookingElement booking,
      DateTime createdAt});

  @override
  $BookingElementCopyWith<$Res> get booking;
}

/// @nodoc
class __$$ReviewsImplCopyWithImpl<$Res>
    extends _$ReviewsCopyWithImpl<$Res, _$ReviewsImpl>
    implements _$$ReviewsImplCopyWith<$Res> {
  __$$ReviewsImplCopyWithImpl(
      _$ReviewsImpl _value, $Res Function(_$ReviewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? booking = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReviewsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      booking: null == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as BookingElement,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewsImpl implements _Reviews {
  const _$ReviewsImpl(
      {@JsonKey(name: "_id") required this.id,
      this.rating = 0,
      required this.booking,
      required this.createdAt});

  factory _$ReviewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewsImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey()
  final int rating;
  @override
  final BookingElement booking;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Reviews(id: $id, rating: $rating, booking: $booking, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rating, booking, createdAt);

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsImplCopyWith<_$ReviewsImpl> get copyWith =>
      __$$ReviewsImplCopyWithImpl<_$ReviewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewsImplToJson(
      this,
    );
  }
}

abstract class _Reviews implements Reviews {
  const factory _Reviews(
      {@JsonKey(name: "_id") required final String id,
      final int rating,
      required final BookingElement booking,
      required final DateTime createdAt}) = _$ReviewsImpl;

  factory _Reviews.fromJson(Map<String, dynamic> json) = _$ReviewsImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  int get rating;
  @override
  BookingElement get booking;
  @override
  DateTime get createdAt;

  /// Create a copy of Reviews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewsImplCopyWith<_$ReviewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
