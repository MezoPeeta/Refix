// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllWorkersHash() => r'b34df0b738dab9f925141f13b5dfb5555bcc4a7d';

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

/// See also [getAllWorkers].
@ProviderFor(getAllWorkers)
const getAllWorkersProvider = GetAllWorkersFamily();

/// See also [getAllWorkers].
class GetAllWorkersFamily extends Family<AsyncValue<List<Worker>>> {
  /// See also [getAllWorkers].
  const GetAllWorkersFamily();

  /// See also [getAllWorkers].
  GetAllWorkersProvider call({
    required int page,
    String? query,
  }) {
    return GetAllWorkersProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetAllWorkersProvider getProviderOverride(
    covariant GetAllWorkersProvider provider,
  ) {
    return call(
      page: provider.page,
      query: provider.query,
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
  String? get name => r'getAllWorkersProvider';
}

/// See also [getAllWorkers].
class GetAllWorkersProvider extends AutoDisposeFutureProvider<List<Worker>> {
  /// See also [getAllWorkers].
  GetAllWorkersProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getAllWorkers(
            ref as GetAllWorkersRef,
            page: page,
            query: query,
          ),
          from: getAllWorkersProvider,
          name: r'getAllWorkersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllWorkersHash,
          dependencies: GetAllWorkersFamily._dependencies,
          allTransitiveDependencies:
              GetAllWorkersFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetAllWorkersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.query,
  }) : super.internal();

  final int page;
  final String? query;

  @override
  Override overrideWith(
    FutureOr<List<Worker>> Function(GetAllWorkersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllWorkersProvider._internal(
        (ref) => create(ref as GetAllWorkersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Worker>> createElement() {
    return _GetAllWorkersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllWorkersProvider &&
        other.page == page &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllWorkersRef on AutoDisposeFutureProviderRef<List<Worker>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetAllWorkersProviderElement
    extends AutoDisposeFutureProviderElement<List<Worker>>
    with GetAllWorkersRef {
  _GetAllWorkersProviderElement(super.provider);

  @override
  int get page => (origin as GetAllWorkersProvider).page;
  @override
  String? get query => (origin as GetAllWorkersProvider).query;
}

String _$getWorkerByIDHash() => r'628d8b722c3091ab58b5aaf2288a3a5498c75549';

/// See also [getWorkerByID].
@ProviderFor(getWorkerByID)
const getWorkerByIDProvider = GetWorkerByIDFamily();

/// See also [getWorkerByID].
class GetWorkerByIDFamily extends Family<AsyncValue<Worker?>> {
  /// See also [getWorkerByID].
  const GetWorkerByIDFamily();

  /// See also [getWorkerByID].
  GetWorkerByIDProvider call({
    required String id,
  }) {
    return GetWorkerByIDProvider(
      id: id,
    );
  }

  @override
  GetWorkerByIDProvider getProviderOverride(
    covariant GetWorkerByIDProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getWorkerByIDProvider';
}

/// See also [getWorkerByID].
class GetWorkerByIDProvider extends AutoDisposeFutureProvider<Worker?> {
  /// See also [getWorkerByID].
  GetWorkerByIDProvider({
    required String id,
  }) : this._internal(
          (ref) => getWorkerByID(
            ref as GetWorkerByIDRef,
            id: id,
          ),
          from: getWorkerByIDProvider,
          name: r'getWorkerByIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWorkerByIDHash,
          dependencies: GetWorkerByIDFamily._dependencies,
          allTransitiveDependencies:
              GetWorkerByIDFamily._allTransitiveDependencies,
          id: id,
        );

  GetWorkerByIDProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Worker?> Function(GetWorkerByIDRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWorkerByIDProvider._internal(
        (ref) => create(ref as GetWorkerByIDRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Worker?> createElement() {
    return _GetWorkerByIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWorkerByIDProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetWorkerByIDRef on AutoDisposeFutureProviderRef<Worker?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetWorkerByIDProviderElement
    extends AutoDisposeFutureProviderElement<Worker?> with GetWorkerByIDRef {
  _GetWorkerByIDProviderElement(super.provider);

  @override
  String get id => (origin as GetWorkerByIDProvider).id;
}

String _$createWorkerHash() => r'd3347be39ce002e87c58ea90a5c313c67b9883f2';

/// See also [createWorker].
@ProviderFor(createWorker)
const createWorkerProvider = CreateWorkerFamily();

/// See also [createWorker].
class CreateWorkerFamily extends Family<AsyncValue<String>> {
  /// See also [createWorker].
  const CreateWorkerFamily();

  /// See also [createWorker].
  CreateWorkerProvider call({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String companyName,
  }) {
    return CreateWorkerProvider(
      username: username,
      email: email,
      password: password,
      phone: phone,
      companyName: companyName,
    );
  }

  @override
  CreateWorkerProvider getProviderOverride(
    covariant CreateWorkerProvider provider,
  ) {
    return call(
      username: provider.username,
      email: provider.email,
      password: provider.password,
      phone: provider.phone,
      companyName: provider.companyName,
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
  String? get name => r'createWorkerProvider';
}

/// See also [createWorker].
class CreateWorkerProvider extends AutoDisposeFutureProvider<String> {
  /// See also [createWorker].
  CreateWorkerProvider({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String companyName,
  }) : this._internal(
          (ref) => createWorker(
            ref as CreateWorkerRef,
            username: username,
            email: email,
            password: password,
            phone: phone,
            companyName: companyName,
          ),
          from: createWorkerProvider,
          name: r'createWorkerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createWorkerHash,
          dependencies: CreateWorkerFamily._dependencies,
          allTransitiveDependencies:
              CreateWorkerFamily._allTransitiveDependencies,
          username: username,
          email: email,
          password: password,
          phone: phone,
          companyName: companyName,
        );

  CreateWorkerProvider._internal(
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
    required this.companyName,
  }) : super.internal();

  final String username;
  final String email;
  final String password;
  final String phone;
  final String companyName;

  @override
  Override overrideWith(
    FutureOr<String> Function(CreateWorkerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateWorkerProvider._internal(
        (ref) => create(ref as CreateWorkerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        password: password,
        phone: phone,
        companyName: companyName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _CreateWorkerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateWorkerProvider &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.companyName == companyName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, companyName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateWorkerRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `companyName` of this provider.
  String get companyName;
}

class _CreateWorkerProviderElement
    extends AutoDisposeFutureProviderElement<String> with CreateWorkerRef {
  _CreateWorkerProviderElement(super.provider);

  @override
  String get username => (origin as CreateWorkerProvider).username;
  @override
  String get email => (origin as CreateWorkerProvider).email;
  @override
  String get password => (origin as CreateWorkerProvider).password;
  @override
  String get phone => (origin as CreateWorkerProvider).phone;
  @override
  String get companyName => (origin as CreateWorkerProvider).companyName;
}

String _$updateWorkerHash() => r'97d2b987bfef6f5df4bb8aaf54b67e54722c56b4';

/// See also [updateWorker].
@ProviderFor(updateWorker)
const updateWorkerProvider = UpdateWorkerFamily();

/// See also [updateWorker].
class UpdateWorkerFamily extends Family<AsyncValue<String>> {
  /// See also [updateWorker].
  const UpdateWorkerFamily();

  /// See also [updateWorker].
  UpdateWorkerProvider call({
    required String username,
    required String id,
    required String email,
    required String password,
    required String phone,
    required String companyName,
  }) {
    return UpdateWorkerProvider(
      username: username,
      id: id,
      email: email,
      password: password,
      phone: phone,
      companyName: companyName,
    );
  }

  @override
  UpdateWorkerProvider getProviderOverride(
    covariant UpdateWorkerProvider provider,
  ) {
    return call(
      username: provider.username,
      id: provider.id,
      email: provider.email,
      password: provider.password,
      phone: provider.phone,
      companyName: provider.companyName,
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
  String? get name => r'updateWorkerProvider';
}

/// See also [updateWorker].
class UpdateWorkerProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateWorker].
  UpdateWorkerProvider({
    required String username,
    required String id,
    required String email,
    required String password,
    required String phone,
    required String companyName,
  }) : this._internal(
          (ref) => updateWorker(
            ref as UpdateWorkerRef,
            username: username,
            id: id,
            email: email,
            password: password,
            phone: phone,
            companyName: companyName,
          ),
          from: updateWorkerProvider,
          name: r'updateWorkerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateWorkerHash,
          dependencies: UpdateWorkerFamily._dependencies,
          allTransitiveDependencies:
              UpdateWorkerFamily._allTransitiveDependencies,
          username: username,
          id: id,
          email: email,
          password: password,
          phone: phone,
          companyName: companyName,
        );

  UpdateWorkerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.id,
    required this.email,
    required this.password,
    required this.phone,
    required this.companyName,
  }) : super.internal();

  final String username;
  final String id;
  final String email;
  final String password;
  final String phone;
  final String companyName;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateWorkerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateWorkerProvider._internal(
        (ref) => create(ref as UpdateWorkerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        id: id,
        email: email,
        password: password,
        phone: phone,
        companyName: companyName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateWorkerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateWorkerProvider &&
        other.username == username &&
        other.id == id &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.companyName == companyName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, companyName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateWorkerRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `companyName` of this provider.
  String get companyName;
}

class _UpdateWorkerProviderElement
    extends AutoDisposeFutureProviderElement<String> with UpdateWorkerRef {
  _UpdateWorkerProviderElement(super.provider);

  @override
  String get username => (origin as UpdateWorkerProvider).username;
  @override
  String get id => (origin as UpdateWorkerProvider).id;
  @override
  String get email => (origin as UpdateWorkerProvider).email;
  @override
  String get password => (origin as UpdateWorkerProvider).password;
  @override
  String get phone => (origin as UpdateWorkerProvider).phone;
  @override
  String get companyName => (origin as UpdateWorkerProvider).companyName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
