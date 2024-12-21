// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  @JsonKey(name: "booking")
  List<BookingElement> get booking => throw _privateConstructorUsedError;
  @JsonKey(name: "count")
  int get count => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {@JsonKey(name: "booking") List<BookingElement> booking,
      @JsonKey(name: "count") int count});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booking = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      booking: null == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as List<BookingElement>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
          _$BookingImpl value, $Res Function(_$BookingImpl) then) =
      __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "booking") List<BookingElement> booking,
      @JsonKey(name: "count") int count});
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
      _$BookingImpl _value, $Res Function(_$BookingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booking = null,
    Object? count = null,
  }) {
    return _then(_$BookingImpl(
      booking: null == booking
          ? _value._booking
          : booking // ignore: cast_nullable_to_non_nullable
              as List<BookingElement>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingImpl implements _Booking {
  const _$BookingImpl(
      {@JsonKey(name: "booking") required final List<BookingElement> booking,
      @JsonKey(name: "count") required this.count})
      : _booking = booking;

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

  final List<BookingElement> _booking;
  @override
  @JsonKey(name: "booking")
  List<BookingElement> get booking {
    if (_booking is EqualUnmodifiableListView) return _booking;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booking);
  }

  @override
  @JsonKey(name: "count")
  final int count;

  @override
  String toString() {
    return 'Booking(booking: $booking, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            const DeepCollectionEquality().equals(other._booking, _booking) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_booking), count);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(
      this,
    );
  }
}

abstract class _Booking implements Booking {
  const factory _Booking(
      {@JsonKey(name: "booking") required final List<BookingElement> booking,
      @JsonKey(name: "count") required final int count}) = _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

  @override
  @JsonKey(name: "booking")
  List<BookingElement> get booking;
  @override
  @JsonKey(name: "count")
  int get count;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingElement _$BookingElementFromJson(Map<String, dynamic> json) {
  return _BookingElement.fromJson(json);
}

/// @nodoc
mixin _$BookingElement {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "services")
  List<Service> get services => throw _privateConstructorUsedError;
  @JsonKey(name: "customer")
  User get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "appointment_date")
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: "notes")
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "images_before_reaper")
  List<String> get imagesBeforeReaper => throw _privateConstructorUsedError;
  @JsonKey(name: "images_after_reaper")
  List<dynamic> get imagesAfterReaper => throw _privateConstructorUsedError;
  @JsonKey(name: "description_problem")
  dynamic get descriptionProblem => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "cost")
  int get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int get v => throw _privateConstructorUsedError;

  /// Serializes this BookingElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingElementCopyWith<BookingElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingElementCopyWith<$Res> {
  factory $BookingElementCopyWith(
          BookingElement value, $Res Function(BookingElement) then) =
      _$BookingElementCopyWithImpl<$Res, BookingElement>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "services") List<Service> services,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "notes") String notes,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper") List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost") int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "__v") int v});

  $UserCopyWith<$Res> get customer;
}

/// @nodoc
class _$BookingElementCopyWithImpl<$Res, $Val extends BookingElement>
    implements $BookingElementCopyWith<$Res> {
  _$BookingElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? services = null,
    Object? customer = null,
    Object? appointmentDate = null,
    Object? notes = null,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      imagesBeforeReaper: null == imagesBeforeReaper
          ? _value.imagesBeforeReaper
          : imagesBeforeReaper // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagesAfterReaper: null == imagesAfterReaper
          ? _value.imagesAfterReaper
          : imagesAfterReaper // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      descriptionProblem: freezed == descriptionProblem
          ? _value.descriptionProblem
          : descriptionProblem // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
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

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get customer {
    return $UserCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingElementImplCopyWith<$Res>
    implements $BookingElementCopyWith<$Res> {
  factory _$$BookingElementImplCopyWith(_$BookingElementImpl value,
          $Res Function(_$BookingElementImpl) then) =
      __$$BookingElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "services") List<Service> services,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "notes") String notes,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper") List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost") int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "__v") int v});

  @override
  $UserCopyWith<$Res> get customer;
}

/// @nodoc
class __$$BookingElementImplCopyWithImpl<$Res>
    extends _$BookingElementCopyWithImpl<$Res, _$BookingElementImpl>
    implements _$$BookingElementImplCopyWith<$Res> {
  __$$BookingElementImplCopyWithImpl(
      _$BookingElementImpl _value, $Res Function(_$BookingElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? services = null,
    Object? customer = null,
    Object? appointmentDate = null,
    Object? notes = null,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
  }) {
    return _then(_$BookingElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      imagesBeforeReaper: null == imagesBeforeReaper
          ? _value._imagesBeforeReaper
          : imagesBeforeReaper // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagesAfterReaper: null == imagesAfterReaper
          ? _value._imagesAfterReaper
          : imagesAfterReaper // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      descriptionProblem: freezed == descriptionProblem
          ? _value.descriptionProblem
          : descriptionProblem // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$BookingElementImpl implements _BookingElement {
  const _$BookingElementImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "services") required final List<Service> services,
      @JsonKey(name: "customer") required this.customer,
      @JsonKey(name: "appointment_date") required this.appointmentDate,
      @JsonKey(name: "notes") required this.notes,
      @JsonKey(name: "images_before_reaper")
      required final List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper")
      required final List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") required this.descriptionProblem,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "cost") required this.cost,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      @JsonKey(name: "__v") required this.v})
      : _services = services,
        _imagesBeforeReaper = imagesBeforeReaper,
        _imagesAfterReaper = imagesAfterReaper;

  factory _$BookingElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingElementImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  final List<Service> _services;
  @override
  @JsonKey(name: "services")
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  @JsonKey(name: "customer")
  final User customer;
  @override
  @JsonKey(name: "appointment_date")
  final DateTime appointmentDate;
  @override
  @JsonKey(name: "notes")
  final String notes;
  final List<String> _imagesBeforeReaper;
  @override
  @JsonKey(name: "images_before_reaper")
  List<String> get imagesBeforeReaper {
    if (_imagesBeforeReaper is EqualUnmodifiableListView)
      return _imagesBeforeReaper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesBeforeReaper);
  }

  final List<dynamic> _imagesAfterReaper;
  @override
  @JsonKey(name: "images_after_reaper")
  List<dynamic> get imagesAfterReaper {
    if (_imagesAfterReaper is EqualUnmodifiableListView)
      return _imagesAfterReaper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesAfterReaper);
  }

  @override
  @JsonKey(name: "description_problem")
  final dynamic descriptionProblem;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "cost")
  final int cost;
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
    return 'BookingElement(id: $id, services: $services, customer: $customer, appointmentDate: $appointmentDate, notes: $notes, imagesBeforeReaper: $imagesBeforeReaper, imagesAfterReaper: $imagesAfterReaper, descriptionProblem: $descriptionProblem, status: $status, cost: $cost, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._imagesBeforeReaper, _imagesBeforeReaper) &&
            const DeepCollectionEquality()
                .equals(other._imagesAfterReaper, _imagesAfterReaper) &&
            const DeepCollectionEquality()
                .equals(other.descriptionProblem, descriptionProblem) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_services),
      customer,
      appointmentDate,
      notes,
      const DeepCollectionEquality().hash(_imagesBeforeReaper),
      const DeepCollectionEquality().hash(_imagesAfterReaper),
      const DeepCollectionEquality().hash(descriptionProblem),
      status,
      cost,
      createdAt,
      updatedAt,
      v);

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingElementImplCopyWith<_$BookingElementImpl> get copyWith =>
      __$$BookingElementImplCopyWithImpl<_$BookingElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingElementImplToJson(
      this,
    );
  }
}

abstract class _BookingElement implements BookingElement {
  const factory _BookingElement(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "services") required final List<Service> services,
      @JsonKey(name: "customer") required final User customer,
      @JsonKey(name: "appointment_date")
      required final DateTime appointmentDate,
      @JsonKey(name: "notes") required final String notes,
      @JsonKey(name: "images_before_reaper")
      required final List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper")
      required final List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem")
      required final dynamic descriptionProblem,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "cost") required final int cost,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      @JsonKey(name: "__v") required final int v}) = _$BookingElementImpl;

  factory _BookingElement.fromJson(Map<String, dynamic> json) =
      _$BookingElementImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "services")
  List<Service> get services;
  @override
  @JsonKey(name: "customer")
  User get customer;
  @override
  @JsonKey(name: "appointment_date")
  DateTime get appointmentDate;
  @override
  @JsonKey(name: "notes")
  String get notes;
  @override
  @JsonKey(name: "images_before_reaper")
  List<String> get imagesBeforeReaper;
  @override
  @JsonKey(name: "images_after_reaper")
  List<dynamic> get imagesAfterReaper;
  @override
  @JsonKey(name: "description_problem")
  dynamic get descriptionProblem;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "cost")
  int get cost;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "__v")
  int get v;

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingElementImplCopyWith<_$BookingElementImpl> get copyWith =>
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
