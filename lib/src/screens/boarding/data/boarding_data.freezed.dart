// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boarding_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Boarding _$BoardingFromJson(Map<String, dynamic> json) {
  return _Boarding.fromJson(json);
}

/// @nodoc
mixin _$Boarding {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Localized get heading => throw _privateConstructorUsedError;
  Localized get details => throw _privateConstructorUsedError;

  /// Serializes this Boarding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardingCopyWith<Boarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardingCopyWith<$Res> {
  factory $BoardingCopyWith(Boarding value, $Res Function(Boarding) then) =
      _$BoardingCopyWithImpl<$Res, Boarding>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String image,
      Localized heading,
      Localized details});

  $LocalizedCopyWith<$Res> get heading;
  $LocalizedCopyWith<$Res> get details;
}

/// @nodoc
class _$BoardingCopyWithImpl<$Res, $Val extends Boarding>
    implements $BoardingCopyWith<$Res> {
  _$BoardingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? heading = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as Localized,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized,
    ) as $Val);
  }

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res> get heading {
    return $LocalizedCopyWith<$Res>(_value.heading, (value) {
      return _then(_value.copyWith(heading: value) as $Val);
    });
  }

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res> get details {
    return $LocalizedCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardingImplCopyWith<$Res>
    implements $BoardingCopyWith<$Res> {
  factory _$$BoardingImplCopyWith(
          _$BoardingImpl value, $Res Function(_$BoardingImpl) then) =
      __$$BoardingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String image,
      Localized heading,
      Localized details});

  @override
  $LocalizedCopyWith<$Res> get heading;
  @override
  $LocalizedCopyWith<$Res> get details;
}

/// @nodoc
class __$$BoardingImplCopyWithImpl<$Res>
    extends _$BoardingCopyWithImpl<$Res, _$BoardingImpl>
    implements _$$BoardingImplCopyWith<$Res> {
  __$$BoardingImplCopyWithImpl(
      _$BoardingImpl _value, $Res Function(_$BoardingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? heading = null,
    Object? details = null,
  }) {
    return _then(_$BoardingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as Localized,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardingImpl with DiagnosticableTreeMixin implements _Boarding {
  const _$BoardingImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.image,
      required this.heading,
      required this.details});

  factory _$BoardingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardingImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String image;
  @override
  final Localized heading;
  @override
  final Localized details;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Boarding(id: $id, image: $image, heading: $heading, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Boarding'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('heading', heading))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, heading, details);

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardingImplCopyWith<_$BoardingImpl> get copyWith =>
      __$$BoardingImplCopyWithImpl<_$BoardingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardingImplToJson(
      this,
    );
  }
}

abstract class _Boarding implements Boarding {
  const factory _Boarding(
      {@JsonKey(name: "_id") required final String id,
      required final String image,
      required final Localized heading,
      required final Localized details}) = _$BoardingImpl;

  factory _Boarding.fromJson(Map<String, dynamic> json) =
      _$BoardingImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get image;
  @override
  Localized get heading;
  @override
  Localized get details;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardingImplCopyWith<_$BoardingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return _Discount.fromJson(json);
}

/// @nodoc
mixin _$Discount {
  @JsonKey(name: "page_name")
  String? get pageName => throw _privateConstructorUsedError;
  Localized? get heading => throw _privateConstructorUsedError;
  Localized? get details => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this Discount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountCopyWith<Discount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCopyWith<$Res> {
  factory $DiscountCopyWith(Discount value, $Res Function(Discount) then) =
      _$DiscountCopyWithImpl<$Res, Discount>;
  @useResult
  $Res call(
      {@JsonKey(name: "page_name") String? pageName,
      Localized? heading,
      Localized? details,
      double? discount,
      bool active});

  $LocalizedCopyWith<$Res>? get heading;
  $LocalizedCopyWith<$Res>? get details;
}

/// @nodoc
class _$DiscountCopyWithImpl<$Res, $Val extends Discount>
    implements $DiscountCopyWith<$Res> {
  _$DiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageName = freezed,
    Object? heading = freezed,
    Object? details = freezed,
    Object? discount = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      pageName: freezed == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as Localized?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedCopyWith<$Res>? get heading {
    if (_value.heading == null) {
      return null;
    }

    return $LocalizedCopyWith<$Res>(_value.heading!, (value) {
      return _then(_value.copyWith(heading: value) as $Val);
    });
  }

  /// Create a copy of Discount
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
abstract class _$$DiscountImplCopyWith<$Res>
    implements $DiscountCopyWith<$Res> {
  factory _$$DiscountImplCopyWith(
          _$DiscountImpl value, $Res Function(_$DiscountImpl) then) =
      __$$DiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "page_name") String? pageName,
      Localized? heading,
      Localized? details,
      double? discount,
      bool active});

  @override
  $LocalizedCopyWith<$Res>? get heading;
  @override
  $LocalizedCopyWith<$Res>? get details;
}

/// @nodoc
class __$$DiscountImplCopyWithImpl<$Res>
    extends _$DiscountCopyWithImpl<$Res, _$DiscountImpl>
    implements _$$DiscountImplCopyWith<$Res> {
  __$$DiscountImplCopyWithImpl(
      _$DiscountImpl _value, $Res Function(_$DiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageName = freezed,
    Object? heading = freezed,
    Object? details = freezed,
    Object? discount = freezed,
    Object? active = null,
  }) {
    return _then(_$DiscountImpl(
      pageName: freezed == pageName
          ? _value.pageName
          : pageName // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as Localized?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Localized?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountImpl with DiagnosticableTreeMixin implements _Discount {
  const _$DiscountImpl(
      {@JsonKey(name: "page_name") this.pageName,
      this.heading,
      this.details,
      this.discount,
      required this.active});

  factory _$DiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountImplFromJson(json);

  @override
  @JsonKey(name: "page_name")
  final String? pageName;
  @override
  final Localized? heading;
  @override
  final Localized? details;
  @override
  final double? discount;
  @override
  final bool active;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Discount(pageName: $pageName, heading: $heading, details: $details, discount: $discount, active: $active)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Discount'))
      ..add(DiagnosticsProperty('pageName', pageName))
      ..add(DiagnosticsProperty('heading', heading))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('active', active));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountImpl &&
            (identical(other.pageName, pageName) ||
                other.pageName == pageName) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageName, heading, details, discount, active);

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      __$$DiscountImplCopyWithImpl<_$DiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountImplToJson(
      this,
    );
  }
}

abstract class _Discount implements Discount {
  const factory _Discount(
      {@JsonKey(name: "page_name") final String? pageName,
      final Localized? heading,
      final Localized? details,
      final double? discount,
      required final bool active}) = _$DiscountImpl;

  factory _Discount.fromJson(Map<String, dynamic> json) =
      _$DiscountImpl.fromJson;

  @override
  @JsonKey(name: "page_name")
  String? get pageName;
  @override
  Localized? get heading;
  @override
  Localized? get details;
  @override
  double? get discount;
  @override
  bool get active;

  /// Create a copy of Discount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
