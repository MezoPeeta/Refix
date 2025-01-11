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
  Worker get user => throw _privateConstructorUsedError;

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
      @JsonKey(name: "user") Worker user});

  $WorkerCopyWith<$Res> get user;
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
              as Worker,
    ) as $Val);
  }

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerCopyWith<$Res> get user {
    return $WorkerCopyWith<$Res>(_value.user, (value) {
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
      @JsonKey(name: "user") Worker user});

  @override
  $WorkerCopyWith<$Res> get user;
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
              as Worker,
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
  final Worker user;

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
      @JsonKey(name: "user") required final Worker user}) = _$UserAccountImpl;

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
  Worker get user;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
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
  @TasksConverter()
  List<Tasks>? get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;

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
      @TasksConverter() List<Tasks>? tasks,
      @JsonKey(name: "phone") String? phone});
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
    Object? tasks = freezed,
    Object? phone = freezed,
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
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Tasks>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      @TasksConverter() List<Tasks>? tasks,
      @JsonKey(name: "phone") String? phone});
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
    Object? tasks = freezed,
    Object? phone = freezed,
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
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Tasks>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @TasksConverter() final List<Tasks>? tasks,
      @JsonKey(name: "phone") this.phone})
      : _tasks = tasks;

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
  final List<Tasks>? _tasks;
  @override
  @TasksConverter()
  List<Tasks>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "phone")
  final String? phone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Worker(notificationToken: $notificationToken, id: $id, email: $email, username: $username, companyName: $companyName, tasks: $tasks, phone: $phone)';
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
      ..add(DiagnosticsProperty('tasks', tasks))
      ..add(DiagnosticsProperty('phone', phone));
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
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationToken,
      id,
      email,
      username,
      companyName,
      const DeepCollectionEquality().hash(_tasks),
      phone);

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
      @TasksConverter() final List<Tasks>? tasks,
      @JsonKey(name: "phone") final String? phone}) = _$WorkerImpl;

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
  @TasksConverter()
  List<Tasks>? get tasks;
  @override
  @JsonKey(name: "phone")
  String? get phone;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
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

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  set title(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  set body(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "read")
  bool get read => throw _privateConstructorUsedError;
  @JsonKey(name: "read")
  set read(bool value) => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "body") String body,
      @JsonKey(name: "read") bool read});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? read = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "body") String body,
      @JsonKey(name: "read") bool read});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? read = null,
  }) {
    return _then(_$NotificationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl with DiagnosticableTreeMixin implements _Notification {
  _$NotificationImpl(
      {@JsonKey(name: "title") required this.title,
      @JsonKey(name: "body") required this.body,
      @JsonKey(name: "read") required this.read});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  @JsonKey(name: "title")
  String title;
  @override
  @JsonKey(name: "body")
  String body;
  @override
  @JsonKey(name: "read")
  bool read;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Notification(title: $title, body: $body, read: $read)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Notification'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('read', read));
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  factory _Notification(
      {@JsonKey(name: "title") required String title,
      @JsonKey(name: "body") required String body,
      @JsonKey(name: "read") required bool read}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String get title;
  @JsonKey(name: "title")
  set title(String value);
  @override
  @JsonKey(name: "body")
  String get body;
  @JsonKey(name: "body")
  set body(String value);
  @override
  @JsonKey(name: "read")
  bool get read;
  @JsonKey(name: "read")
  set read(bool value);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tasks _$TasksFromJson(Map<String, dynamic> json) {
  return _Tasks.fromJson(json);
}

/// @nodoc
mixin _$Tasks {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  User? get customer => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method", defaultValue: "CASH")
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Tasks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksCopyWith<Tasks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksCopyWith<$Res> {
  factory $TasksCopyWith(Tasks value, $Res Function(Tasks) then) =
      _$TasksCopyWithImpl<$Res, Tasks>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      List<Service> services,
      User? customer,
      double cost,
      @JsonKey(name: "payment_method", defaultValue: "CASH")
      String paymentMethod,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      String status});

  $UserCopyWith<$Res>? get customer;
}

/// @nodoc
class _$TasksCopyWithImpl<$Res, $Val extends Tasks>
    implements $TasksCopyWith<$Res> {
  _$TasksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? services = null,
    Object? customer = freezed,
    Object? cost = null,
    Object? paymentMethod = null,
    Object? createdAt = freezed,
    Object? status = null,
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TasksImplCopyWith<$Res> implements $TasksCopyWith<$Res> {
  factory _$$TasksImplCopyWith(
          _$TasksImpl value, $Res Function(_$TasksImpl) then) =
      __$$TasksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      List<Service> services,
      User? customer,
      double cost,
      @JsonKey(name: "payment_method", defaultValue: "CASH")
      String paymentMethod,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      String status});

  @override
  $UserCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$TasksImplCopyWithImpl<$Res>
    extends _$TasksCopyWithImpl<$Res, _$TasksImpl>
    implements _$$TasksImplCopyWith<$Res> {
  __$$TasksImplCopyWithImpl(
      _$TasksImpl _value, $Res Function(_$TasksImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? services = null,
    Object? customer = freezed,
    Object? cost = null,
    Object? paymentMethod = null,
    Object? createdAt = freezed,
    Object? status = null,
  }) {
    return _then(_$TasksImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksImpl with DiagnosticableTreeMixin implements _Tasks {
  const _$TasksImpl(
      {@JsonKey(name: "_id") required this.id,
      required final List<Service> services,
      this.customer,
      this.cost = 0,
      @JsonKey(name: "payment_method", defaultValue: "CASH")
      required this.paymentMethod,
      @JsonKey(name: "createdAt") this.createdAt,
      required this.status})
      : _services = services;

  factory _$TasksImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final User? customer;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey(name: "payment_method", defaultValue: "CASH")
  final String paymentMethod;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Tasks(id: $id, services: $services, customer: $customer, cost: $cost, paymentMethod: $paymentMethod, createdAt: $createdAt, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Tasks'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('services', services))
      ..add(DiagnosticsProperty('customer', customer))
      ..add(DiagnosticsProperty('cost', cost))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_services),
      customer,
      cost,
      paymentMethod,
      createdAt,
      status);

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksImplCopyWith<_$TasksImpl> get copyWith =>
      __$$TasksImplCopyWithImpl<_$TasksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksImplToJson(
      this,
    );
  }
}

abstract class _Tasks implements Tasks {
  const factory _Tasks(
      {@JsonKey(name: "_id") required final String id,
      required final List<Service> services,
      final User? customer,
      final double cost,
      @JsonKey(name: "payment_method", defaultValue: "CASH")
      required final String paymentMethod,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      required final String status}) = _$TasksImpl;

  factory _Tasks.fromJson(Map<String, dynamic> json) = _$TasksImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  List<Service> get services;
  @override
  User? get customer;
  @override
  double get cost;
  @override
  @JsonKey(name: "payment_method", defaultValue: "CASH")
  String get paymentMethod;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  String get status;

  /// Create a copy of Tasks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksImplCopyWith<_$TasksImpl> get copyWith =>
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
class _$ServiceImpl with DiagnosticableTreeMixin implements _Service {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Service(name: $name, details: $details, id: $id, price: $price, isActive: $isActive, image: $image, type: $type, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Service'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('createdAt', createdAt));
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

Localized _$LocalizedFromJson(Map<String, dynamic> json) {
  return _Localized.fromJson(json);
}

/// @nodoc
mixin _$Localized {
  String? get localized => throw _privateConstructorUsedError;

  /// Serializes this Localized to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Localized
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizedCopyWith<Localized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedCopyWith<$Res> {
  factory $LocalizedCopyWith(Localized value, $Res Function(Localized) then) =
      _$LocalizedCopyWithImpl<$Res, Localized>;
  @useResult
  $Res call({String? localized});
}

/// @nodoc
class _$LocalizedCopyWithImpl<$Res, $Val extends Localized>
    implements $LocalizedCopyWith<$Res> {
  _$LocalizedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Localized
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localized = freezed,
  }) {
    return _then(_value.copyWith(
      localized: freezed == localized
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizedImplCopyWith<$Res>
    implements $LocalizedCopyWith<$Res> {
  factory _$$LocalizedImplCopyWith(
          _$LocalizedImpl value, $Res Function(_$LocalizedImpl) then) =
      __$$LocalizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? localized});
}

/// @nodoc
class __$$LocalizedImplCopyWithImpl<$Res>
    extends _$LocalizedCopyWithImpl<$Res, _$LocalizedImpl>
    implements _$$LocalizedImplCopyWith<$Res> {
  __$$LocalizedImplCopyWithImpl(
      _$LocalizedImpl _value, $Res Function(_$LocalizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Localized
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localized = freezed,
  }) {
    return _then(_$LocalizedImpl(
      localized: freezed == localized
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizedImpl with DiagnosticableTreeMixin implements _Localized {
  const _$LocalizedImpl({this.localized});

  factory _$LocalizedImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizedImplFromJson(json);

  @override
  final String? localized;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Localized(localized: $localized)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Localized'))
      ..add(DiagnosticsProperty('localized', localized));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizedImpl &&
            (identical(other.localized, localized) ||
                other.localized == localized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, localized);

  /// Create a copy of Localized
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizedImplCopyWith<_$LocalizedImpl> get copyWith =>
      __$$LocalizedImplCopyWithImpl<_$LocalizedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizedImplToJson(
      this,
    );
  }
}

abstract class _Localized implements Localized {
  const factory _Localized({final String? localized}) = _$LocalizedImpl;

  factory _Localized.fromJson(Map<String, dynamic> json) =
      _$LocalizedImpl.fromJson;

  @override
  String? get localized;

  /// Create a copy of Localized
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizedImplCopyWith<_$LocalizedImpl> get copyWith =>
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
  @JsonKey(name: "is_verified", defaultValue: false)
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
      @JsonKey(name: "is_verified", defaultValue: false) bool isVerified,
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
      @JsonKey(name: "is_verified", defaultValue: false) bool isVerified,
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
      @JsonKey(name: "is_verified", defaultValue: false)
      required this.isVerified,
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
  @JsonKey(name: "is_verified", defaultValue: false)
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
          @JsonKey(name: "is_verified", defaultValue: false)
          required final bool isVerified,
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
  @JsonKey(name: "is_verified", defaultValue: false)
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
