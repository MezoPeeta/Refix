// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCustomersHash() => r'fd87ed59b06075800697db188a796e3a41565b70';

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

/// See also [getCustomers].
@ProviderFor(getCustomers)
const getCustomersProvider = GetCustomersFamily();

/// See also [getCustomers].
class GetCustomersFamily extends Family<AsyncValue<List<User>>> {
  /// See also [getCustomers].
  const GetCustomersFamily();

  /// See also [getCustomers].
  GetCustomersProvider call({
    required int page,
    String? query,
  }) {
    return GetCustomersProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetCustomersProvider getProviderOverride(
    covariant GetCustomersProvider provider,
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
  String? get name => r'getCustomersProvider';
}

/// See also [getCustomers].
class GetCustomersProvider extends AutoDisposeFutureProvider<List<User>> {
  /// See also [getCustomers].
  GetCustomersProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getCustomers(
            ref as GetCustomersRef,
            page: page,
            query: query,
          ),
          from: getCustomersProvider,
          name: r'getCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCustomersHash,
          dependencies: GetCustomersFamily._dependencies,
          allTransitiveDependencies:
              GetCustomersFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetCustomersProvider._internal(
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
    FutureOr<List<User>> Function(GetCustomersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCustomersProvider._internal(
        (ref) => create(ref as GetCustomersRef),
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
  AutoDisposeFutureProviderElement<List<User>> createElement() {
    return _GetCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCustomersProvider &&
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
mixin GetCustomersRef on AutoDisposeFutureProviderRef<List<User>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<User>> with GetCustomersRef {
  _GetCustomersProviderElement(super.provider);

  @override
  int get page => (origin as GetCustomersProvider).page;
  @override
  String? get query => (origin as GetCustomersProvider).query;
}

String _$getUsersHash() => r'675c4ea50402fcaedfb6abdd45ecd688cb357e44';

/// See also [getUsers].
@ProviderFor(getUsers)
const getUsersProvider = GetUsersFamily();

/// See also [getUsers].
class GetUsersFamily extends Family<AsyncValue<List<User>>> {
  /// See also [getUsers].
  const GetUsersFamily();

  /// See also [getUsers].
  GetUsersProvider call({
    required int page,
    String? query,
  }) {
    return GetUsersProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetUsersProvider getProviderOverride(
    covariant GetUsersProvider provider,
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
  String? get name => r'getUsersProvider';
}

/// See also [getUsers].
class GetUsersProvider extends AutoDisposeFutureProvider<List<User>> {
  /// See also [getUsers].
  GetUsersProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getUsers(
            ref as GetUsersRef,
            page: page,
            query: query,
          ),
          from: getUsersProvider,
          name: r'getUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUsersHash,
          dependencies: GetUsersFamily._dependencies,
          allTransitiveDependencies: GetUsersFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetUsersProvider._internal(
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
    FutureOr<List<User>> Function(GetUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUsersProvider._internal(
        (ref) => create(ref as GetUsersRef),
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
  AutoDisposeFutureProviderElement<List<User>> createElement() {
    return _GetUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUsersProvider &&
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
mixin GetUsersRef on AutoDisposeFutureProviderRef<List<User>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<User>> with GetUsersRef {
  _GetUsersProviderElement(super.provider);

  @override
  int get page => (origin as GetUsersProvider).page;
  @override
  String? get query => (origin as GetUsersProvider).query;
}

String _$getLocationHash() => r'16f08bc9518c5df32b9454e50b9e06b998089a70';

/// See also [getLocation].
@ProviderFor(getLocation)
const getLocationProvider = GetLocationFamily();

/// See also [getLocation].
class GetLocationFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getLocation].
  const GetLocationFamily();

  /// See also [getLocation].
  GetLocationProvider call({
    required List<User> users,
  }) {
    return GetLocationProvider(
      users: users,
    );
  }

  @override
  GetLocationProvider getProviderOverride(
    covariant GetLocationProvider provider,
  ) {
    return call(
      users: provider.users,
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
  String? get name => r'getLocationProvider';
}

/// See also [getLocation].
class GetLocationProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getLocation].
  GetLocationProvider({
    required List<User> users,
  }) : this._internal(
          (ref) => getLocation(
            ref as GetLocationRef,
            users: users,
          ),
          from: getLocationProvider,
          name: r'getLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLocationHash,
          dependencies: GetLocationFamily._dependencies,
          allTransitiveDependencies:
              GetLocationFamily._allTransitiveDependencies,
          users: users,
        );

  GetLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.users,
  }) : super.internal();

  final List<User> users;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetLocationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLocationProvider._internal(
        (ref) => create(ref as GetLocationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        users: users,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLocationProvider && other.users == users;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, users.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetLocationRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `users` of this provider.
  List<User> get users;
}

class _GetLocationProviderElement
    extends AutoDisposeFutureProviderElement<List<String>> with GetLocationRef {
  _GetLocationProviderElement(super.provider);

  @override
  List<User> get users => (origin as GetLocationProvider).users;
}

String _$getBookingHash() => r'afbb25eae7f3aa706ec8bfe612f6cfdf3524e207';

/// See also [getBooking].
@ProviderFor(getBooking)
const getBookingProvider = GetBookingFamily();

/// See also [getBooking].
class GetBookingFamily extends Family<AsyncValue<List<BookingElement>>> {
  /// See also [getBooking].
  const GetBookingFamily();

  /// See also [getBooking].
  GetBookingProvider call({
    required int page,
    String? query,
  }) {
    return GetBookingProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetBookingProvider getProviderOverride(
    covariant GetBookingProvider provider,
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
  String? get name => r'getBookingProvider';
}

/// See also [getBooking].
class GetBookingProvider
    extends AutoDisposeFutureProvider<List<BookingElement>> {
  /// See also [getBooking].
  GetBookingProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getBooking(
            ref as GetBookingRef,
            page: page,
            query: query,
          ),
          from: getBookingProvider,
          name: r'getBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBookingHash,
          dependencies: GetBookingFamily._dependencies,
          allTransitiveDependencies:
              GetBookingFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetBookingProvider._internal(
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
    FutureOr<List<BookingElement>> Function(GetBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookingProvider._internal(
        (ref) => create(ref as GetBookingRef),
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
  AutoDisposeFutureProviderElement<List<BookingElement>> createElement() {
    return _GetBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookingProvider &&
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
mixin GetBookingRef on AutoDisposeFutureProviderRef<List<BookingElement>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetBookingProviderElement
    extends AutoDisposeFutureProviderElement<List<BookingElement>>
    with GetBookingRef {
  _GetBookingProviderElement(super.provider);

  @override
  int get page => (origin as GetBookingProvider).page;
  @override
  String? get query => (origin as GetBookingProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
