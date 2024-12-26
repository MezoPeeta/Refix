// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCustomersHash() => r'd96f4d090977fb9969a28a44f2b4ed80efc40afc';

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

String _$getUsersHash() => r'1d3ead9f5a590509332e49baa3043a82fa201320';

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

String _$getUnAssignedBookingsHash() =>
    r'3141cd93b33681ccc010351f6a9dbd4f42daa7c9';

/// See also [getUnAssignedBookings].
@ProviderFor(getUnAssignedBookings)
const getUnAssignedBookingsProvider = GetUnAssignedBookingsFamily();

/// See also [getUnAssignedBookings].
class GetUnAssignedBookingsFamily
    extends Family<AsyncValue<List<BookingElement>>> {
  /// See also [getUnAssignedBookings].
  const GetUnAssignedBookingsFamily();

  /// See also [getUnAssignedBookings].
  GetUnAssignedBookingsProvider call({
    required int page,
    String? query,
  }) {
    return GetUnAssignedBookingsProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetUnAssignedBookingsProvider getProviderOverride(
    covariant GetUnAssignedBookingsProvider provider,
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
  String? get name => r'getUnAssignedBookingsProvider';
}

/// See also [getUnAssignedBookings].
class GetUnAssignedBookingsProvider
    extends AutoDisposeFutureProvider<List<BookingElement>> {
  /// See also [getUnAssignedBookings].
  GetUnAssignedBookingsProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getUnAssignedBookings(
            ref as GetUnAssignedBookingsRef,
            page: page,
            query: query,
          ),
          from: getUnAssignedBookingsProvider,
          name: r'getUnAssignedBookingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUnAssignedBookingsHash,
          dependencies: GetUnAssignedBookingsFamily._dependencies,
          allTransitiveDependencies:
              GetUnAssignedBookingsFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetUnAssignedBookingsProvider._internal(
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
    FutureOr<List<BookingElement>> Function(GetUnAssignedBookingsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUnAssignedBookingsProvider._internal(
        (ref) => create(ref as GetUnAssignedBookingsRef),
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
    return _GetUnAssignedBookingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUnAssignedBookingsProvider &&
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
mixin GetUnAssignedBookingsRef
    on AutoDisposeFutureProviderRef<List<BookingElement>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetUnAssignedBookingsProviderElement
    extends AutoDisposeFutureProviderElement<List<BookingElement>>
    with GetUnAssignedBookingsRef {
  _GetUnAssignedBookingsProviderElement(super.provider);

  @override
  int get page => (origin as GetUnAssignedBookingsProvider).page;
  @override
  String? get query => (origin as GetUnAssignedBookingsProvider).query;
}

String _$getBookingsHash() => r'55a3e687c4ebeed456549a0c47c64d6c62cc7cd0';

/// See also [getBookings].
@ProviderFor(getBookings)
const getBookingsProvider = GetBookingsFamily();

/// See also [getBookings].
class GetBookingsFamily extends Family<AsyncValue<List<BookingElement>>> {
  /// See also [getBookings].
  const GetBookingsFamily();

  /// See also [getBookings].
  GetBookingsProvider call({
    required int page,
    String? query,
  }) {
    return GetBookingsProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetBookingsProvider getProviderOverride(
    covariant GetBookingsProvider provider,
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
  String? get name => r'getBookingsProvider';
}

/// See also [getBookings].
class GetBookingsProvider
    extends AutoDisposeFutureProvider<List<BookingElement>> {
  /// See also [getBookings].
  GetBookingsProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getBookings(
            ref as GetBookingsRef,
            page: page,
            query: query,
          ),
          from: getBookingsProvider,
          name: r'getBookingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBookingsHash,
          dependencies: GetBookingsFamily._dependencies,
          allTransitiveDependencies:
              GetBookingsFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetBookingsProvider._internal(
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
    FutureOr<List<BookingElement>> Function(GetBookingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookingsProvider._internal(
        (ref) => create(ref as GetBookingsRef),
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
    return _GetBookingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookingsProvider &&
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
mixin GetBookingsRef on AutoDisposeFutureProviderRef<List<BookingElement>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetBookingsProviderElement
    extends AutoDisposeFutureProviderElement<List<BookingElement>>
    with GetBookingsRef {
  _GetBookingsProviderElement(super.provider);

  @override
  int get page => (origin as GetBookingsProvider).page;
  @override
  String? get query => (origin as GetBookingsProvider).query;
}

String _$convertRoleHash() => r'bc42b970ef8ed1a319a8461b76fdb800ca296db0';

/// See also [convertRole].
@ProviderFor(convertRole)
const convertRoleProvider = ConvertRoleFamily();

/// See also [convertRole].
class ConvertRoleFamily extends Family<AsyncValue<Role?>> {
  /// See also [convertRole].
  const ConvertRoleFamily();

  /// See also [convertRole].
  ConvertRoleProvider call({
    required Object? data,
  }) {
    return ConvertRoleProvider(
      data: data,
    );
  }

  @override
  ConvertRoleProvider getProviderOverride(
    covariant ConvertRoleProvider provider,
  ) {
    return call(
      data: provider.data,
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
  String? get name => r'convertRoleProvider';
}

/// See also [convertRole].
class ConvertRoleProvider extends AutoDisposeFutureProvider<Role?> {
  /// See also [convertRole].
  ConvertRoleProvider({
    required Object? data,
  }) : this._internal(
          (ref) => convertRole(
            ref as ConvertRoleRef,
            data: data,
          ),
          from: convertRoleProvider,
          name: r'convertRoleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$convertRoleHash,
          dependencies: ConvertRoleFamily._dependencies,
          allTransitiveDependencies:
              ConvertRoleFamily._allTransitiveDependencies,
          data: data,
        );

  ConvertRoleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Object? data;

  @override
  Override overrideWith(
    FutureOr<Role?> Function(ConvertRoleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConvertRoleProvider._internal(
        (ref) => create(ref as ConvertRoleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Role?> createElement() {
    return _ConvertRoleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConvertRoleProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConvertRoleRef on AutoDisposeFutureProviderRef<Role?> {
  /// The parameter `data` of this provider.
  Object? get data;
}

class _ConvertRoleProviderElement
    extends AutoDisposeFutureProviderElement<Role?> with ConvertRoleRef {
  _ConvertRoleProviderElement(super.provider);

  @override
  Object? get data => (origin as ConvertRoleProvider).data;
}

String _$assignWorkerToBookingHash() =>
    r'6ee669a9713e65d6ce208b81026b204f26ede87e';

/// See also [assignWorkerToBooking].
@ProviderFor(assignWorkerToBooking)
const assignWorkerToBookingProvider = AssignWorkerToBookingFamily();

/// See also [assignWorkerToBooking].
class AssignWorkerToBookingFamily extends Family<AsyncValue<String?>> {
  /// See also [assignWorkerToBooking].
  const AssignWorkerToBookingFamily();

  /// See also [assignWorkerToBooking].
  AssignWorkerToBookingProvider call({
    required String bookingID,
    required String workerID,
  }) {
    return AssignWorkerToBookingProvider(
      bookingID: bookingID,
      workerID: workerID,
    );
  }

  @override
  AssignWorkerToBookingProvider getProviderOverride(
    covariant AssignWorkerToBookingProvider provider,
  ) {
    return call(
      bookingID: provider.bookingID,
      workerID: provider.workerID,
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
  String? get name => r'assignWorkerToBookingProvider';
}

/// See also [assignWorkerToBooking].
class AssignWorkerToBookingProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [assignWorkerToBooking].
  AssignWorkerToBookingProvider({
    required String bookingID,
    required String workerID,
  }) : this._internal(
          (ref) => assignWorkerToBooking(
            ref as AssignWorkerToBookingRef,
            bookingID: bookingID,
            workerID: workerID,
          ),
          from: assignWorkerToBookingProvider,
          name: r'assignWorkerToBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assignWorkerToBookingHash,
          dependencies: AssignWorkerToBookingFamily._dependencies,
          allTransitiveDependencies:
              AssignWorkerToBookingFamily._allTransitiveDependencies,
          bookingID: bookingID,
          workerID: workerID,
        );

  AssignWorkerToBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingID,
    required this.workerID,
  }) : super.internal();

  final String bookingID;
  final String workerID;

  @override
  Override overrideWith(
    FutureOr<String?> Function(AssignWorkerToBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssignWorkerToBookingProvider._internal(
        (ref) => create(ref as AssignWorkerToBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingID: bookingID,
        workerID: workerID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _AssignWorkerToBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssignWorkerToBookingProvider &&
        other.bookingID == bookingID &&
        other.workerID == workerID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingID.hashCode);
    hash = _SystemHash.combine(hash, workerID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AssignWorkerToBookingRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `bookingID` of this provider.
  String get bookingID;

  /// The parameter `workerID` of this provider.
  String get workerID;
}

class _AssignWorkerToBookingProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with AssignWorkerToBookingRef {
  _AssignWorkerToBookingProviderElement(super.provider);

  @override
  String get bookingID => (origin as AssignWorkerToBookingProvider).bookingID;
  @override
  String get workerID => (origin as AssignWorkerToBookingProvider).workerID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
