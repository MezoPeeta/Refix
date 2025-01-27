// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  double get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ReviewCustomer get customer => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {double rating,
      String? comment,
      ReviewCustomer customer,
      DateTime? createdAt,
      DateTime? updatedAt});

  $ReviewCustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? customer = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as ReviewCustomer,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewCustomerCopyWith<$Res> get customer {
    return $ReviewCustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rating,
      String? comment,
      ReviewCustomer customer,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $ReviewCustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? customer = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReviewImpl(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as ReviewCustomer,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.rating,
      this.comment,
      required this.customer,
      this.createdAt,
      this.updatedAt});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final double rating;
  @override
  final String? comment;
  @override
  final ReviewCustomer customer;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Review(rating: $rating, comment: $comment, customer: $customer, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating, comment, customer, createdAt, updatedAt);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final double rating,
      final String? comment,
      required final ReviewCustomer customer,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  double get rating;
  @override
  String? get comment;
  @override
  ReviewCustomer get customer;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewCustomer _$ReviewCustomerFromJson(Map<String, dynamic> json) {
  return _ReviewCustomer.fromJson(json);
}

/// @nodoc
mixin _$ReviewCustomer {
  String get username => throw _privateConstructorUsedError;

  /// Serializes this ReviewCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCustomerCopyWith<ReviewCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCustomerCopyWith<$Res> {
  factory $ReviewCustomerCopyWith(
          ReviewCustomer value, $Res Function(ReviewCustomer) then) =
      _$ReviewCustomerCopyWithImpl<$Res, ReviewCustomer>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class _$ReviewCustomerCopyWithImpl<$Res, $Val extends ReviewCustomer>
    implements $ReviewCustomerCopyWith<$Res> {
  _$ReviewCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewCustomerImplCopyWith<$Res>
    implements $ReviewCustomerCopyWith<$Res> {
  factory _$$ReviewCustomerImplCopyWith(_$ReviewCustomerImpl value,
          $Res Function(_$ReviewCustomerImpl) then) =
      __$$ReviewCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$ReviewCustomerImplCopyWithImpl<$Res>
    extends _$ReviewCustomerCopyWithImpl<$Res, _$ReviewCustomerImpl>
    implements _$$ReviewCustomerImplCopyWith<$Res> {
  __$$ReviewCustomerImplCopyWithImpl(
      _$ReviewCustomerImpl _value, $Res Function(_$ReviewCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$ReviewCustomerImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewCustomerImpl implements _ReviewCustomer {
  const _$ReviewCustomerImpl({required this.username});

  factory _$ReviewCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewCustomerImplFromJson(json);

  @override
  final String username;

  @override
  String toString() {
    return 'ReviewCustomer(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewCustomerImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of ReviewCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewCustomerImplCopyWith<_$ReviewCustomerImpl> get copyWith =>
      __$$ReviewCustomerImplCopyWithImpl<_$ReviewCustomerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewCustomerImplToJson(
      this,
    );
  }
}

abstract class _ReviewCustomer implements ReviewCustomer {
  const factory _ReviewCustomer({required final String username}) =
      _$ReviewCustomerImpl;

  factory _ReviewCustomer.fromJson(Map<String, dynamic> json) =
      _$ReviewCustomerImpl.fromJson;

  @override
  String get username;

  /// Create a copy of ReviewCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewCustomerImplCopyWith<_$ReviewCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
