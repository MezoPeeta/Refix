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
String _$forgetPasswordHash() => r'de9825af709bc0cda51078efa638bef6902748a9';

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

String _$verifyOTPHash() => r'c91e3df4a297f13382e66a9828d4092728eb9e2a';

/// See also [verifyOTP].
@ProviderFor(verifyOTP)
const verifyOTPProvider = VerifyOTPFamily();

/// See also [verifyOTP].
class VerifyOTPFamily extends Family<AsyncValue<bool>> {
  /// See also [verifyOTP].
  const VerifyOTPFamily();

  /// See also [verifyOTP].
  VerifyOTPProvider call({
    required String otp,
  }) {
    return VerifyOTPProvider(
      otp: otp,
    );
  }

  @override
  VerifyOTPProvider getProviderOverride(
    covariant VerifyOTPProvider provider,
  ) {
    return call(
      otp: provider.otp,
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
  String? get name => r'verifyOTPProvider';
}

/// See also [verifyOTP].
class VerifyOTPProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [verifyOTP].
  VerifyOTPProvider({
    required String otp,
  }) : this._internal(
          (ref) => verifyOTP(
            ref as VerifyOTPRef,
            otp: otp,
          ),
          from: verifyOTPProvider,
          name: r'verifyOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOTPHash,
          dependencies: VerifyOTPFamily._dependencies,
          allTransitiveDependencies: VerifyOTPFamily._allTransitiveDependencies,
          otp: otp,
        );

  VerifyOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otp,
  }) : super.internal();

  final String otp;

  @override
  Override overrideWith(
    FutureOr<bool> Function(VerifyOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOTPProvider._internal(
        (ref) => create(ref as VerifyOTPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otp: otp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _VerifyOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOTPProvider && other.otp == otp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VerifyOTPRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `otp` of this provider.
  String get otp;
}

class _VerifyOTPProviderElement extends AutoDisposeFutureProviderElement<bool>
    with VerifyOTPRef {
  _VerifyOTPProviderElement(super.provider);

  @override
  String get otp => (origin as VerifyOTPProvider).otp;
}

String _$resetPasswordHash() => r'd563f4f1f123a7870a1938c1e9911c006512210b';

/// See also [resetPassword].
@ProviderFor(resetPassword)
const resetPasswordProvider = ResetPasswordFamily();

/// See also [resetPassword].
class ResetPasswordFamily extends Family<AsyncValue<String>> {
  /// See also [resetPassword].
  const ResetPasswordFamily();

  /// See also [resetPassword].
  ResetPasswordProvider call({
    required String otp,
    required String password,
  }) {
    return ResetPasswordProvider(
      otp: otp,
      password: password,
    );
  }

  @override
  ResetPasswordProvider getProviderOverride(
    covariant ResetPasswordProvider provider,
  ) {
    return call(
      otp: provider.otp,
      password: provider.password,
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
  String? get name => r'resetPasswordProvider';
}

/// See also [resetPassword].
class ResetPasswordProvider extends AutoDisposeFutureProvider<String> {
  /// See also [resetPassword].
  ResetPasswordProvider({
    required String otp,
    required String password,
  }) : this._internal(
          (ref) => resetPassword(
            ref as ResetPasswordRef,
            otp: otp,
            password: password,
          ),
          from: resetPasswordProvider,
          name: r'resetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordHash,
          dependencies: ResetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordFamily._allTransitiveDependencies,
          otp: otp,
          password: password,
        );

  ResetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otp,
    required this.password,
  }) : super.internal();

  final String otp;
  final String password;

  @override
  Override overrideWith(
    FutureOr<String> Function(ResetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordProvider._internal(
        (ref) => create(ref as ResetPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otp: otp,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _ResetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordProvider &&
        other.otp == otp &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResetPasswordRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `password` of this provider.
  String get password;
}

class _ResetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<String> with ResetPasswordRef {
  _ResetPasswordProviderElement(super.provider);

  @override
  String get otp => (origin as ResetPasswordProvider).otp;
  @override
  String get password => (origin as ResetPasswordProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
