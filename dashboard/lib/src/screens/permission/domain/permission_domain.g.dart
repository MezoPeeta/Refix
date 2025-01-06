// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createPermissionUserHash() =>
    r'eae24d3652d10d0dcc7fa087e30f92e3c47a9dcb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [createPermissionUser].
@ProviderFor(createPermissionUser)
const createPermissionUserProvider = CreatePermissionUserFamily();

/// See also [createPermissionUser].
class CreatePermissionUserFamily extends Family<AsyncValue<String>> {
  /// See also [createPermissionUser].
  const CreatePermissionUserFamily();

  /// See also [createPermissionUser].
  CreatePermissionUserProvider call({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String roleID,
  }) {
    return CreatePermissionUserProvider(
      username: username,
      email: email,
      password: password,
      phone: phone,
      roleID: roleID,
    );
  }

  @override
  CreatePermissionUserProvider getProviderOverride(
    covariant CreatePermissionUserProvider provider,
  ) {
    return call(
      username: provider.username,
      email: provider.email,
      password: provider.password,
      phone: provider.phone,
      roleID: provider.roleID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createPermissionUserProvider';
}

/// See also [createPermissionUser].
class CreatePermissionUserProvider extends AutoDisposeFutureProvider<String> {
  /// See also [createPermissionUser].
  CreatePermissionUserProvider({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String roleID,
  }) : this._internal(
          (ref) => createPermissionUser(
            ref as CreatePermissionUserRef,
            username: username,
            email: email,
            password: password,
            phone: phone,
            roleID: roleID,
          ),
          from: createPermissionUserProvider,
          name: r'createPermissionUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPermissionUserHash,
          dependencies: CreatePermissionUserFamily._dependencies,
          allTransitiveDependencies:
              CreatePermissionUserFamily._allTransitiveDependencies,
          username: username,
          email: email,
          password: password,
          phone: phone,
          roleID: roleID,
        );

  CreatePermissionUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleID,
  }) : super.internal();

  final String username;
  final String email;
  final String password;
  final String phone;
  final String roleID;

  @override
  Override overrideWith(
    FutureOr<String> Function(CreatePermissionUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePermissionUserProvider._internal(
        (ref) => create(ref as CreatePermissionUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        password: password,
        phone: phone,
        roleID: roleID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _CreatePermissionUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePermissionUserProvider &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.roleID == roleID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, roleID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreatePermissionUserRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `roleID` of this provider.
  String get roleID;
}

class _CreatePermissionUserProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with CreatePermissionUserRef {
  _CreatePermissionUserProviderElement(super.provider);

  @override
  String get username => (origin as CreatePermissionUserProvider).username;
  @override
  String get email => (origin as CreatePermissionUserProvider).email;
  @override
  String get password => (origin as CreatePermissionUserProvider).password;
  @override
  String get phone => (origin as CreatePermissionUserProvider).phone;
  @override
  String get roleID => (origin as CreatePermissionUserProvider).roleID;
}

String _$updatePermissionUserHash() =>
    r'009da5c047f86f402499974f68f2a65ea36e5af9';

/// See also [updatePermissionUser].
@ProviderFor(updatePermissionUser)
const updatePermissionUserProvider = UpdatePermissionUserFamily();

/// See also [updatePermissionUser].
class UpdatePermissionUserFamily extends Family<AsyncValue<String>> {
  /// See also [updatePermissionUser].
  const UpdatePermissionUserFamily();

  /// See also [updatePermissionUser].
  UpdatePermissionUserProvider call({
    required String username,
    required String email,
    required String id,
    required String phone,
    required String roleID,
  }) {
    return UpdatePermissionUserProvider(
      username: username,
      email: email,
      id: id,
      phone: phone,
      roleID: roleID,
    );
  }

  @override
  UpdatePermissionUserProvider getProviderOverride(
    covariant UpdatePermissionUserProvider provider,
  ) {
    return call(
      username: provider.username,
      email: provider.email,
      id: provider.id,
      phone: provider.phone,
      roleID: provider.roleID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updatePermissionUserProvider';
}

/// See also [updatePermissionUser].
class UpdatePermissionUserProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updatePermissionUser].
  UpdatePermissionUserProvider({
    required String username,
    required String email,
    required String id,
    required String phone,
    required String roleID,
  }) : this._internal(
          (ref) => updatePermissionUser(
            ref as UpdatePermissionUserRef,
            username: username,
            email: email,
            id: id,
            phone: phone,
            roleID: roleID,
          ),
          from: updatePermissionUserProvider,
          name: r'updatePermissionUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePermissionUserHash,
          dependencies: UpdatePermissionUserFamily._dependencies,
          allTransitiveDependencies:
              UpdatePermissionUserFamily._allTransitiveDependencies,
          username: username,
          email: email,
          id: id,
          phone: phone,
          roleID: roleID,
        );

  UpdatePermissionUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.email,
    required this.id,
    required this.phone,
    required this.roleID,
  }) : super.internal();

  final String username;
  final String email;
  final String id;
  final String phone;
  final String roleID;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdatePermissionUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePermissionUserProvider._internal(
        (ref) => create(ref as UpdatePermissionUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        id: id,
        phone: phone,
        roleID: roleID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdatePermissionUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePermissionUserProvider &&
        other.username == username &&
        other.email == email &&
        other.id == id &&
        other.phone == phone &&
        other.roleID == roleID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, roleID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatePermissionUserRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `roleID` of this provider.
  String get roleID;
}

class _UpdatePermissionUserProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with UpdatePermissionUserRef {
  _UpdatePermissionUserProviderElement(super.provider);

  @override
  String get username => (origin as UpdatePermissionUserProvider).username;
  @override
  String get email => (origin as UpdatePermissionUserProvider).email;
  @override
  String get id => (origin as UpdatePermissionUserProvider).id;
  @override
  String get phone => (origin as UpdatePermissionUserProvider).phone;
  @override
  String get roleID => (origin as UpdatePermissionUserProvider).roleID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
