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
  Worker? get worker => throw _privateConstructorUsedError;
  @JsonKey(name: "appointment_date")
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: "note")
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: "images_before_reaper")
  List<String> get imagesBeforeReaper => throw _privateConstructorUsedError;
  @JsonKey(name: "images_after_reaper", defaultValue: [])
  List<String> get imagesAfterReaper => throw _privateConstructorUsedError;
  @JsonKey(name: "description_problem")
  dynamic get descriptionProblem => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "cost", defaultValue: 0)
  int get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get resolved => throw _privateConstructorUsedError;

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
      Worker? worker,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper", defaultValue: [])
      List<String> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost", defaultValue: 0) int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      bool resolved});

  $UserCopyWith<$Res> get customer;
  $WorkerCopyWith<$Res>? get worker;
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
    Object? worker = freezed,
    Object? appointmentDate = null,
    Object? note = freezed,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? resolved = null,
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
      worker: freezed == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as Worker?,
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
              as List<String>,
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
      resolved: null == resolved
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of BookingElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerCopyWith<$Res>? get worker {
    if (_value.worker == null) {
      return null;
    }

    return $WorkerCopyWith<$Res>(_value.worker!, (value) {
      return _then(_value.copyWith(worker: value) as $Val);
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
      Worker? worker,
      @JsonKey(name: "appointment_date") DateTime appointmentDate,
      @JsonKey(name: "note") String? note,
      @JsonKey(name: "images_before_reaper") List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper", defaultValue: [])
      List<String> imagesAfterReaper,
      @JsonKey(name: "description_problem") dynamic descriptionProblem,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "cost", defaultValue: 0) int cost,
      @JsonKey(name: "createdAt") DateTime createdAt,
      bool resolved});

  @override
  $UserCopyWith<$Res> get customer;
  @override
  $WorkerCopyWith<$Res>? get worker;
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
    Object? worker = freezed,
    Object? appointmentDate = null,
    Object? note = freezed,
    Object? imagesBeforeReaper = null,
    Object? imagesAfterReaper = null,
    Object? descriptionProblem = freezed,
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? resolved = null,
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
      worker: freezed == worker
          ? _value.worker
          : worker // ignore: cast_nullable_to_non_nullable
              as Worker?,
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
              as List<String>,
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
      resolved: null == resolved
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as bool,
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
      this.worker,
      @JsonKey(name: "appointment_date") required this.appointmentDate,
      @JsonKey(name: "note") this.note,
      @JsonKey(name: "images_before_reaper")
      required final List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper", defaultValue: [])
      required final List<String> imagesAfterReaper,
      @JsonKey(name: "description_problem") this.descriptionProblem,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "cost", defaultValue: 0) required this.cost,
      @JsonKey(name: "createdAt") required this.createdAt,
      this.resolved = false})
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
  final Worker? worker;
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

  final List<String> _imagesAfterReaper;
  @override
  @JsonKey(name: "images_after_reaper", defaultValue: [])
  List<String> get imagesAfterReaper {
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
  @JsonKey(name: "cost", defaultValue: 0)
  final int cost;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool resolved;

  @override
  String toString() {
    return 'BookingElement(id: $id, services: $services, customer: $customer, worker: $worker, appointmentDate: $appointmentDate, note: $note, imagesBeforeReaper: $imagesBeforeReaper, imagesAfterReaper: $imagesAfterReaper, descriptionProblem: $descriptionProblem, status: $status, cost: $cost, createdAt: $createdAt, resolved: $resolved)';
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
            (identical(other.worker, worker) || other.worker == worker) &&
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
            (identical(other.resolved, resolved) ||
                other.resolved == resolved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_services),
      customer,
      worker,
      appointmentDate,
      note,
      const DeepCollectionEquality().hash(_imagesBeforeReaper),
      const DeepCollectionEquality().hash(_imagesAfterReaper),
      const DeepCollectionEquality().hash(descriptionProblem),
      status,
      cost,
      createdAt,
      resolved);

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
      final Worker? worker,
      @JsonKey(name: "appointment_date")
      required final DateTime appointmentDate,
      @JsonKey(name: "note") final String? note,
      @JsonKey(name: "images_before_reaper")
      required final List<String> imagesBeforeReaper,
      @JsonKey(name: "images_after_reaper", defaultValue: [])
      required final List<String> imagesAfterReaper,
      @JsonKey(name: "description_problem") final dynamic descriptionProblem,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "cost", defaultValue: 0) required final int cost,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      final bool resolved}) = _$BookingElementImpl;

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
  Worker? get worker;
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
  @JsonKey(name: "images_after_reaper", defaultValue: [])
  List<String> get imagesAfterReaper;
  @override
  @JsonKey(name: "description_problem")
  dynamic get descriptionProblem;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "cost", defaultValue: 0)
  int get cost;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  bool get resolved;

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
  Localized? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "details")
  Localized? get details => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "type", defaultValue: "")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "name") Localized? name,
      @JsonKey(name: "details") Localized? details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "type", defaultValue: "") String? type,
      @JsonKey(name: "createdAt") DateTime? createdAt});

  $LocalizedCopyWith<$Res>? get name;
  $LocalizedCopyWith<$Res>? get details;
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
    Object? name = freezed,
    Object? details = freezed,
    Object? id = null,
    Object? price = null,
    Object? isActive = null,
    Object? image = null,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Localized?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $LocalizedCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of Service
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
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") Localized? name,
      @JsonKey(name: "details") Localized? details,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "is_active") bool isActive,
      @JsonKey(name: "image") String image,
      @JsonKey(name: "type", defaultValue: "") String? type,
      @JsonKey(name: "createdAt") DateTime? createdAt});

  @override
  $LocalizedCopyWith<$Res>? get name;
  @override
  $LocalizedCopyWith<$Res>? get details;
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
    Object? name = freezed,
    Object? details = freezed,
    Object? id = null,
    Object? price = null,
    Object? isActive = null,
    Object? image = null,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ServiceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Localized?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "details") this.details,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "is_active") required this.isActive,
      @JsonKey(name: "image") required this.image,
      @JsonKey(name: "type", defaultValue: "") this.type,
      @JsonKey(name: "createdAt") this.createdAt});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final Localized? name;
  @override
  @JsonKey(name: "details")
  final Localized? details;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "price")
  final int price;
  @override
  @JsonKey(name: "is_active")
  final bool isActive;
  @override
  @JsonKey(name: "image")
  final String image;
  @override
  @JsonKey(name: "type", defaultValue: "")
  final String? type;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Service(name: $name, details: $details, id: $id, price: $price, isActive: $isActive, image: $image, type: $type, createdAt: $createdAt)';
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
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, details, id, price, isActive, image, type, createdAt);

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
      {@JsonKey(name: "name") final Localized? name,
      @JsonKey(name: "details") final Localized? details,
      @JsonKey(name: "_id") required final String id,
      @JsonKey(name: "price") required final int price,
      @JsonKey(name: "is_active") required final bool isActive,
      @JsonKey(name: "image") required final String image,
      @JsonKey(name: "type", defaultValue: "") final String? type,
      @JsonKey(name: "createdAt") final DateTime? createdAt}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  @JsonKey(name: "name")
  Localized? get name;
  @override
  @JsonKey(name: "details")
  Localized? get details;
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
  @JsonKey(name: "image")
  String get image;
  @override
  @JsonKey(name: "type", defaultValue: "")
  String? get type;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
