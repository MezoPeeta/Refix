// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return _UserAccount.fromJson(json);
}

/// @nodoc
mixin _$UserAccount {
  @JsonKey(name: "accessToken")
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "refreshToken")
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User get user => throw _privateConstructorUsedError;

  /// Serializes this UserAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountCopyWith<UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountCopyWith<$Res> {
  factory $UserAccountCopyWith(
          UserAccount value, $Res Function(UserAccount) then) =
      _$UserAccountCopyWithImpl<$Res, UserAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: "accessToken") String accessToken,
      @JsonKey(name: "refreshToken") String refreshToken,
      @JsonKey(name: "user") User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserAccountCopyWithImpl<$Res, $Val extends UserAccount>
    implements $UserAccountCopyWith<$Res> {
  _$UserAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAccountImplCopyWith<$Res>
    implements $UserAccountCopyWith<$Res> {
  factory _$$UserAccountImplCopyWith(
          _$UserAccountImpl value, $Res Function(_$UserAccountImpl) then) =
      __$$UserAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "accessToken") String accessToken,
      @JsonKey(name: "refreshToken") String refreshToken,
      @JsonKey(name: "user") User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserAccountImplCopyWithImpl<$Res>
    extends _$UserAccountCopyWithImpl<$Res, _$UserAccountImpl>
    implements _$$UserAccountImplCopyWith<$Res> {
  __$$UserAccountImplCopyWithImpl(
      _$UserAccountImpl _value, $Res Function(_$UserAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(_$UserAccountImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountImpl with DiagnosticableTreeMixin implements _UserAccount {
  const _$UserAccountImpl(
      {@JsonKey(name: "accessToken") required this.accessToken,
      @JsonKey(name: "refreshToken") required this.refreshToken,
      @JsonKey(name: "user") required this.user});

  factory _$UserAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountImplFromJson(json);

  @override
  @JsonKey(name: "accessToken")
  final String accessToken;
  @override
  @JsonKey(name: "refreshToken")
  final String refreshToken;
  @override
  @JsonKey(name: "user")
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAccount(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAccount'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken, user);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      __$$UserAccountImplCopyWithImpl<_$UserAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountImplToJson(
      this,
    );
  }
}

abstract class _UserAccount implements UserAccount {
  const factory _UserAccount(
      {@JsonKey(name: "accessToken") required final String accessToken,
      @JsonKey(name: "refreshToken") required final String refreshToken,
      @JsonKey(name: "user") required final User user}) = _$UserAccountImpl;

  factory _UserAccount.fromJson(Map<String, dynamic> json) =
      _$UserAccountImpl.fromJson;

  @override
  @JsonKey(name: "accessToken")
  String get accessToken;
  @override
  @JsonKey(name: "refreshToken")
  String get refreshToken;
  @override
  @JsonKey(name: "user")
  User get user;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "notification_token")
  String? get notificationToken => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "lang")
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "lat")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  Role get role => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "notification_token") String? notificationToken,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "lang") double? longitude,
      @JsonKey(name: "lat") double? latitude,
      @JsonKey(name: "role") Role role,
      @JsonKey(name: "is_verified") bool isVerified,
      @JsonKey(name: "createdAt") DateTime createdAt});

  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = freezed,
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? role = null,
    Object? isVerified = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "notification_token") String? notificationToken,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "lang") double? longitude,
      @JsonKey(name: "lat") double? latitude,
      @JsonKey(name: "role") Role role,
      @JsonKey(name: "is_verified") bool isVerified,
      @JsonKey(name: "createdAt") DateTime createdAt});

  @override
  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = freezed,
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? role = null,
    Object? isVerified = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserImpl(
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {@JsonKey(name: "notification_token") this.notificationToken,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "lang") this.longitude,
      @JsonKey(name: "lat") this.latitude,
      @JsonKey(name: "role") required this.role,
      @JsonKey(name: "is_verified") required this.isVerified,
      @JsonKey(name: "createdAt") required this.createdAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "notification_token")
  final String? notificationToken;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "lang")
  final double? longitude;
  @override
  @JsonKey(name: "lat")
  final double? latitude;
  @override
  @JsonKey(name: "role")
  final Role role;
  @override
  @JsonKey(name: "is_verified")
  final bool isVerified;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(notificationToken: $notificationToken, id: $id, username: $username, email: $email, phone: $phone, longitude: $longitude, latitude: $latitude, role: $role, isVerified: $isVerified, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('notificationToken', notificationToken))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.notificationToken, notificationToken) ||
                other.notificationToken == notificationToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationToken, id, username,
      email, phone, longitude, latitude, role, isVerified, createdAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
          {@JsonKey(name: "notification_token") final String? notificationToken,
          @JsonKey(name: "_id") required final String id,
          @JsonKey(name: "username") required final String username,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "phone") final String? phone,
          @JsonKey(name: "lang") final double? longitude,
          @JsonKey(name: "lat") final double? latitude,
          @JsonKey(name: "role") required final Role role,
          @JsonKey(name: "is_verified") required final bool isVerified,
          @JsonKey(name: "createdAt") required final DateTime createdAt}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "notification_token")
  String? get notificationToken;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "lang")
  double? get longitude;
  @override
  @JsonKey(name: "lat")
  double? get latitude;
  @override
  @JsonKey(name: "role")
  Role get role;
  @override
  @JsonKey(name: "is_verified")
  bool get isVerified;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Role to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id, @JsonKey(name: "name") String name});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleImplCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$RoleImplCopyWith(
          _$RoleImpl value, $Res Function(_$RoleImpl) then) =
      __$$RoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id, @JsonKey(name: "name") String name});
}

/// @nodoc
class __$$RoleImplCopyWithImpl<$Res>
    extends _$RoleCopyWithImpl<$Res, _$RoleImpl>
    implements _$$RoleImplCopyWith<$Res> {
  __$$RoleImplCopyWithImpl(_$RoleImpl _value, $Res Function(_$RoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RoleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleImpl with DiagnosticableTreeMixin implements _Role {
  const _$RoleImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "name") required this.name});

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Role(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Role'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      __$$RoleImplCopyWithImpl<_$RoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleImplToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "name") required final String name}) = _$RoleImpl;

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return _Worker.fromJson(json);
}

/// @nodoc
mixin _$Worker {
  @JsonKey(name: "notification_token")
  String? get notificationToken => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "company_name")
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  Role get role => throw _privateConstructorUsedError;

  /// Serializes this Worker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call(
      {@JsonKey(name: "notification_token") String? notificationToken,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "role") Role role});

  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = freezed,
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? companyName = null,
    Object? phone = freezed,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ) as $Val);
  }

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "notification_token") String? notificationToken,
      @JsonKey(name: "_id") String id,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "role") Role role});

  @override
  $RoleCopyWith<$Res> get role;
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationToken = freezed,
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? companyName = null,
    Object? phone = freezed,
    Object? role = null,
  }) {
    return _then(_$WorkerImpl(
      notificationToken: freezed == notificationToken
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerImpl with DiagnosticableTreeMixin implements _Worker {
  const _$WorkerImpl(
      {@JsonKey(name: "notification_token") this.notificationToken,
      @JsonKey(name: "_id") required this.id,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "company_name") required this.companyName,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "role") required this.role});

  factory _$WorkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerImplFromJson(json);

  @override
  @JsonKey(name: "notification_token")
  final String? notificationToken;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "company_name")
  final String companyName;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "role")
  final Role role;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Worker(notificationToken: $notificationToken, id: $id, email: $email, username: $username, companyName: $companyName, phone: $phone, role: $role)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Worker'))
      ..add(DiagnosticsProperty('notificationToken', notificationToken))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('role', role));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerImpl &&
            (identical(other.notificationToken, notificationToken) ||
                other.notificationToken == notificationToken) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationToken, id, email,
      username, companyName, phone, role);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerImplToJson(
      this,
    );
  }
}

abstract class _Worker implements Worker {
  const factory _Worker(
      {@JsonKey(name: "notification_token") final String? notificationToken,
      @JsonKey(name: "_id") required final String id,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "username") required final String username,
      @JsonKey(name: "company_name") required final String companyName,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "role") required final Role role}) = _$WorkerImpl;

  factory _Worker.fromJson(Map<String, dynamic> json) = _$WorkerImpl.fromJson;

  @override
  @JsonKey(name: "notification_token")
  String? get notificationToken;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "company_name")
  String get companyName;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "role")
  Role get role;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
