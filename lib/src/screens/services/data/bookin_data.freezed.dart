// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookin_data.dart';

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
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "services")
  List<Service> get services => throw _privateConstructorUsedError;
  @JsonKey(name: "customer")
  User get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "appointment_date")
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "services") List<Service> services,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper") List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost") int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  $UserCopyWith<$Res> get customer;
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
    Object? id = null,
    Object? services = null,
    Object? customer = null,
    Object? appointmentDate = null,
    Object? note = freezed,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }

  /// Create a copy of Booking
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
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
          _$BookingImpl value, $Res Function(_$BookingImpl) then) =
      __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "services") List<Service> services,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper") List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost") int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});

  @override
  $UserCopyWith<$Res> get customer;
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
    Object? id = null,
    Object? services = null,
    Object? customer = null,
    Object? appointmentDate = null,
    Object? note = freezed,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BookingImpl(
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingImpl implements _Booking {
  const _$BookingImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "services") required final List<Service> services,
      @JsonKey(name: "customer") required this.customer,
      @JsonKey(name: "appointment_date") required this.appointmentDate,
      @JsonKey(name: "note") this.note,
      @JsonKey(name: "images_before_reaper")
      required final List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper")
      required final List<dynamic> imagesAfterReaper,
      @JsonKey(name: "description_problem") required this.descriptionProblem,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "cost") required this.cost,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt})
      : _services = services,
        _imagesBeforeReaper = imagesBeforeReaper,
        _imagesAfterReaper = imagesAfterReaper;

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

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
  @JsonKey(name: "note")
  final String? note;
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
  String toString() {
    return 'Booking(id: $id, services: $services, customer: $customer, appointmentDate: $appointmentDate, note: $note, imagesBeforeReaper: $imagesBeforeReaper, imagesAfterReaper: $imagesAfterReaper, descriptionProblem: $descriptionProblem, status: $status, cost: $cost, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.note, note) || other.note == note) &&
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
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_services),
      customer,
      appointmentDate,
      note,
      const DeepCollectionEquality().hash(_imagesBeforeReaper),
      const DeepCollectionEquality().hash(_imagesAfterReaper),
      const DeepCollectionEquality().hash(descriptionProblem),
      status,
      cost,
      createdAt,
      updatedAt);

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
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "services") required final List<Service> services,
          @JsonKey(name: "customer") required final User customer,
          @JsonKey(name: "appointment_date")
          required final DateTime appointmentDate,
          @JsonKey(name: "note") final String? note,
          @JsonKey(name: "images_before_reaper")
          required final List<String> imagesBeforeReaper,
          @JsonKey(name: "images_after_reaper")
          required final List<dynamic> imagesAfterReaper,
          @JsonKey(name: "description_problem")
          required final dynamic descriptionProblem,
          @JsonKey(name: "status") required final String status,
          @JsonKey(name: "cost") required final int cost,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

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
  @JsonKey(name: "note")
  String? get note;
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

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
