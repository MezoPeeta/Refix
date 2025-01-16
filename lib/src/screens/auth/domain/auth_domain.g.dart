// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentUserHash() => r'7c0392fe920753f2124e67f96e8b36b0a081bee2';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider = AutoDisposeFutureProvider<User?>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentUserRef = AutoDisposeFutureProviderRef<User?>;
String _$updateCurrentUserHash() => r'0e59811258797e6a2ea3cd97ab7793ea8b714c50';

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

/// See also [updateCurrentUser].
@ProviderFor(updateCurrentUser)
const updateCurrentUserProvider = UpdateCurrentUserFamily();

/// See also [updateCurrentUser].
class UpdateCurrentUserFamily extends Family<AsyncValue<String?>> {
  /// See also [updateCurrentUser].
  const UpdateCurrentUserFamily();

  /// See also [updateCurrentUser].
  UpdateCurrentUserProvider call({
    required User user,
  }) {
    return UpdateCurrentUserProvider(
      user: user,
    );
  }

  @override
  UpdateCurrentUserProvider getProviderOverride(
    covariant UpdateCurrentUserProvider provider,
  ) {
    return call(
      user: provider.user,
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
  String? get name => r'updateCurrentUserProvider';
}

/// See also [updateCurrentUser].
class UpdateCurrentUserProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [updateCurrentUser].
  UpdateCurrentUserProvider({
    required User user,
  }) : this._internal(
          (ref) => updateCurrentUser(
            ref as UpdateCurrentUserRef,
            user: user,
          ),
          from: updateCurrentUserProvider,
          name: r'updateCurrentUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCurrentUserHash,
          dependencies: UpdateCurrentUserFamily._dependencies,
          allTransitiveDependencies:
              UpdateCurrentUserFamily._allTransitiveDependencies,
          user: user,
        );

  UpdateCurrentUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final User user;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UpdateCurrentUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCurrentUserProvider._internal(
        (ref) => create(ref as UpdateCurrentUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UpdateCurrentUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCurrentUserProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateCurrentUserRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `user` of this provider.
  User get user;
}

class _UpdateCurrentUserProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with UpdateCurrentUserRef {
  _UpdateCurrentUserProviderElement(super.provider);

  @override
  User get user => (origin as UpdateCurrentUserProvider).user;
}

String _$deleteCurrentUserHash() => r'4eb9d3507a355a023ae768883e476df9c18f259a';

/// See also [deleteCurrentUser].
@ProviderFor(deleteCurrentUser)
final deleteCurrentUserProvider = AutoDisposeFutureProvider<void>.internal(
  deleteCurrentUser,
  name: r'deleteCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteCurrentUserRef = AutoDisposeFutureProviderRef<void>;
String _$forgetPasswordHash() => r'1635545c85b21424635781433e96e73c1a085989';

/// See also [forgetPassword].
@ProviderFor(forgetPassword)
const forgetPasswordProvider = ForgetPasswordFamily();

/// See also [forgetPassword].
class ForgetPasswordFamily extends Family<AsyncValue<String>> {
  /// See also [forgetPassword].
  const ForgetPasswordFamily();

  /// See also [forgetPassword].
  ForgetPasswordProvider call({
    required String email,
  }) {
    return ForgetPasswordProvider(
      email: email,
    );
  }

  @override
  ForgetPasswordProvider getProviderOverride(
    covariant ForgetPasswordProvider provider,
  ) {
    return call(
      email: provider.email,
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
  String? get name => r'forgetPasswordProvider';
}

/// See also [forgetPassword].
class ForgetPasswordProvider extends AutoDisposeFutureProvider<String> {
  /// See also [forgetPassword].
  ForgetPasswordProvider({
    required String email,
  }) : this._internal(
          (ref) => forgetPassword(
            ref as ForgetPasswordRef,
            email: email,
          ),
          from: forgetPasswordProvider,
          name: r'forgetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgetPasswordHash,
          dependencies: ForgetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ForgetPasswordFamily._allTransitiveDependencies,
          email: email,
        );

  ForgetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<String> Function(ForgetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgetPasswordProvider._internal(
        (ref) => create(ref as ForgetPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _ForgetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForgetPasswordProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForgetPasswordRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `email` of this provider.
  String get email;
}

class _ForgetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<String> with ForgetPasswordRef {
  _ForgetPasswordProviderElement(super.provider);

  @override
  String get email => (origin as ForgetPasswordProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
