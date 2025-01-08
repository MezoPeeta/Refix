// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addBookingHash() => r'eda644b796387e3ff63b9beddbb4144837a8cfc9';

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

/// See also [addBooking].
@ProviderFor(addBooking)
const addBookingProvider = AddBookingFamily();

/// See also [addBooking].
class AddBookingFamily extends Family<AsyncValue<String>> {
  /// See also [addBooking].
  const AddBookingFamily();

  /// See also [addBooking].
  AddBookingProvider call({
    required List<String> services,
    required DateTime date,
    required String notes,
    required List<String> images,
  }) {
    return AddBookingProvider(
      services: services,
      date: date,
      notes: notes,
      images: images,
    );
  }

  @override
  AddBookingProvider getProviderOverride(
    covariant AddBookingProvider provider,
  ) {
    return call(
      services: provider.services,
      date: provider.date,
      notes: provider.notes,
      images: provider.images,
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
  String? get name => r'addBookingProvider';
}

/// See also [addBooking].
class AddBookingProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addBooking].
  AddBookingProvider({
    required List<String> services,
    required DateTime date,
    required String notes,
    required List<String> images,
  }) : this._internal(
          (ref) => addBooking(
            ref as AddBookingRef,
            services: services,
            date: date,
            notes: notes,
            images: images,
          ),
          from: addBookingProvider,
          name: r'addBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addBookingHash,
          dependencies: AddBookingFamily._dependencies,
          allTransitiveDependencies:
              AddBookingFamily._allTransitiveDependencies,
          services: services,
          date: date,
          notes: notes,
          images: images,
        );

  AddBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.services,
    required this.date,
    required this.notes,
    required this.images,
  }) : super.internal();

  final List<String> services;
  final DateTime date;
  final String notes;
  final List<String> images;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddBookingProvider._internal(
        (ref) => create(ref as AddBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        services: services,
        date: date,
        notes: notes,
        images: images,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddBookingProvider &&
        other.services == services &&
        other.date == date &&
        other.notes == notes &&
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, services.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddBookingRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `services` of this provider.
  List<String> get services;

  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `notes` of this provider.
  String get notes;

  /// The parameter `images` of this provider.
  List<String> get images;
}

class _AddBookingProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddBookingRef {
  _AddBookingProviderElement(super.provider);

  @override
  List<String> get services => (origin as AddBookingProvider).services;
  @override
  DateTime get date => (origin as AddBookingProvider).date;
  @override
  String get notes => (origin as AddBookingProvider).notes;
  @override
  List<String> get images => (origin as AddBookingProvider).images;
}

String _$updateCustomerHash() => r'e740123cd2c1182fb965f602fbb6e91772abce5a';

/// See also [updateCustomer].
@ProviderFor(updateCustomer)
const updateCustomerProvider = UpdateCustomerFamily();

/// See also [updateCustomer].
class UpdateCustomerFamily extends Family<AsyncValue<void>> {
  /// See also [updateCustomer].
  const UpdateCustomerFamily();

  /// See also [updateCustomer].
  UpdateCustomerProvider call({
    required User customer,
  }) {
    return UpdateCustomerProvider(
      customer: customer,
    );
  }

  @override
  UpdateCustomerProvider getProviderOverride(
    covariant UpdateCustomerProvider provider,
  ) {
    return call(
      customer: provider.customer,
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
  String? get name => r'updateCustomerProvider';
}

/// See also [updateCustomer].
class UpdateCustomerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateCustomer].
  UpdateCustomerProvider({
    required User customer,
  }) : this._internal(
          (ref) => updateCustomer(
            ref as UpdateCustomerRef,
            customer: customer,
          ),
          from: updateCustomerProvider,
          name: r'updateCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCustomerHash,
          dependencies: UpdateCustomerFamily._dependencies,
          allTransitiveDependencies:
              UpdateCustomerFamily._allTransitiveDependencies,
          customer: customer,
        );

  UpdateCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customer,
  }) : super.internal();

  final User customer;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCustomerProvider._internal(
        (ref) => create(ref as UpdateCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customer: customer,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCustomerProvider && other.customer == customer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateCustomerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `customer` of this provider.
  User get customer;
}

class _UpdateCustomerProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateCustomerRef {
  _UpdateCustomerProviderElement(super.provider);

  @override
  User get customer => (origin as UpdateCustomerProvider).customer;
}

String _$getUserBookingHash() => r'af7a9d05548d70495b82b832e189e151096746e6';

/// See also [getUserBooking].
@ProviderFor(getUserBooking)
final getUserBookingProvider =
    AutoDisposeFutureProvider<List<Booking>>.internal(
  getUserBooking,
  name: r'getUserBookingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserBookingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserBookingRef = AutoDisposeFutureProviderRef<List<Booking>>;
String _$getLocationHash() => r'cdba494ca7f795c737f1cb9f5d516d1eae5ed35f';

/// See also [getLocation].
@ProviderFor(getLocation)
const getLocationProvider = GetLocationFamily();

/// See also [getLocation].
class GetLocationFamily extends Family<AsyncValue<String?>> {
  /// See also [getLocation].
  const GetLocationFamily();

  /// See also [getLocation].
  GetLocationProvider call({
    required double latitude,
    required double longitude,
  }) {
    return GetLocationProvider(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  GetLocationProvider getProviderOverride(
    covariant GetLocationProvider provider,
  ) {
    return call(
      latitude: provider.latitude,
      longitude: provider.longitude,
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
class GetLocationProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [getLocation].
  GetLocationProvider({
    required double latitude,
    required double longitude,
  }) : this._internal(
          (ref) => getLocation(
            ref as GetLocationRef,
            latitude: latitude,
            longitude: longitude,
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
          latitude: latitude,
          longitude: longitude,
        );

  GetLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latitude,
    required this.longitude,
  }) : super.internal();

  final double latitude;
  final double longitude;

  @override
  Override overrideWith(
    FutureOr<String?> Function(GetLocationRef provider) create,
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
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _GetLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLocationProvider &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetLocationRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _GetLocationProviderElement
    extends AutoDisposeFutureProviderElement<String?> with GetLocationRef {
  _GetLocationProviderElement(super.provider);

  @override
  double get latitude => (origin as GetLocationProvider).latitude;
  @override
  double get longitude => (origin as GetLocationProvider).longitude;
}

String _$updateBookingHash() => r'931898328dca4c065d3fd3221b1ae3c680a1998f';

/// See also [updateBooking].
@ProviderFor(updateBooking)
const updateBookingProvider = UpdateBookingFamily();

/// See also [updateBooking].
class UpdateBookingFamily extends Family<AsyncValue<String>> {
  /// See also [updateBooking].
  const UpdateBookingFamily();

  /// See also [updateBooking].
  UpdateBookingProvider call({
    required Booking booking,
  }) {
    return UpdateBookingProvider(
      booking: booking,
    );
  }

  @override
  UpdateBookingProvider getProviderOverride(
    covariant UpdateBookingProvider provider,
  ) {
    return call(
      booking: provider.booking,
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
  String? get name => r'updateBookingProvider';
}

/// See also [updateBooking].
class UpdateBookingProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateBooking].
  UpdateBookingProvider({
    required Booking booking,
  }) : this._internal(
          (ref) => updateBooking(
            ref as UpdateBookingRef,
            booking: booking,
          ),
          from: updateBookingProvider,
          name: r'updateBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBookingHash,
          dependencies: UpdateBookingFamily._dependencies,
          allTransitiveDependencies:
              UpdateBookingFamily._allTransitiveDependencies,
          booking: booking,
        );

  UpdateBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.booking,
  }) : super.internal();

  final Booking booking;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateBookingProvider._internal(
        (ref) => create(ref as UpdateBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        booking: booking,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBookingProvider && other.booking == booking;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, booking.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateBookingRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `booking` of this provider.
  Booking get booking;
}

class _UpdateBookingProviderElement
    extends AutoDisposeFutureProviderElement<String> with UpdateBookingRef {
  _UpdateBookingProviderElement(super.provider);

  @override
  Booking get booking => (origin as UpdateBookingProvider).booking;
}

String _$addNoteBookingHash() => r'c7c489386736de83b484b372e3ed2d21851139ba';

/// See also [addNoteBooking].
@ProviderFor(addNoteBooking)
const addNoteBookingProvider = AddNoteBookingFamily();

/// See also [addNoteBooking].
class AddNoteBookingFamily extends Family<AsyncValue<String>> {
  /// See also [addNoteBooking].
  const AddNoteBookingFamily();

  /// See also [addNoteBooking].
  AddNoteBookingProvider call({
    required int bookingID,
    required String note,
  }) {
    return AddNoteBookingProvider(
      bookingID: bookingID,
      note: note,
    );
  }

  @override
  AddNoteBookingProvider getProviderOverride(
    covariant AddNoteBookingProvider provider,
  ) {
    return call(
      bookingID: provider.bookingID,
      note: provider.note,
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
  String? get name => r'addNoteBookingProvider';
}

/// See also [addNoteBooking].
class AddNoteBookingProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addNoteBooking].
  AddNoteBookingProvider({
    required int bookingID,
    required String note,
  }) : this._internal(
          (ref) => addNoteBooking(
            ref as AddNoteBookingRef,
            bookingID: bookingID,
            note: note,
          ),
          from: addNoteBookingProvider,
          name: r'addNoteBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addNoteBookingHash,
          dependencies: AddNoteBookingFamily._dependencies,
          allTransitiveDependencies:
              AddNoteBookingFamily._allTransitiveDependencies,
          bookingID: bookingID,
          note: note,
        );

  AddNoteBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingID,
    required this.note,
  }) : super.internal();

  final int bookingID;
  final String note;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddNoteBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddNoteBookingProvider._internal(
        (ref) => create(ref as AddNoteBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingID: bookingID,
        note: note,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddNoteBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddNoteBookingProvider &&
        other.bookingID == bookingID &&
        other.note == note;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingID.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddNoteBookingRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `bookingID` of this provider.
  int get bookingID;

  /// The parameter `note` of this provider.
  String get note;
}

class _AddNoteBookingProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddNoteBookingRef {
  _AddNoteBookingProviderElement(super.provider);

  @override
  int get bookingID => (origin as AddNoteBookingProvider).bookingID;
  @override
  String get note => (origin as AddNoteBookingProvider).note;
}

String _$getDiscountHash() => r'197fa13a00afeda26fd7f72518deffa3909acab3';

/// See also [getDiscount].
@ProviderFor(getDiscount)
const getDiscountProvider = GetDiscountFamily();

/// See also [getDiscount].
class GetDiscountFamily extends Family<AsyncValue<Discount?>> {
  /// See also [getDiscount].
  const GetDiscountFamily();

  /// See also [getDiscount].
  GetDiscountProvider call({
    required String pageName,
  }) {
    return GetDiscountProvider(
      pageName: pageName,
    );
  }

  @override
  GetDiscountProvider getProviderOverride(
    covariant GetDiscountProvider provider,
  ) {
    return call(
      pageName: provider.pageName,
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
  String? get name => r'getDiscountProvider';
}

/// See also [getDiscount].
class GetDiscountProvider extends AutoDisposeFutureProvider<Discount?> {
  /// See also [getDiscount].
  GetDiscountProvider({
    required String pageName,
  }) : this._internal(
          (ref) => getDiscount(
            ref as GetDiscountRef,
            pageName: pageName,
          ),
          from: getDiscountProvider,
          name: r'getDiscountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDiscountHash,
          dependencies: GetDiscountFamily._dependencies,
          allTransitiveDependencies:
              GetDiscountFamily._allTransitiveDependencies,
          pageName: pageName,
        );

  GetDiscountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageName,
  }) : super.internal();

  final String pageName;

  @override
  Override overrideWith(
    FutureOr<Discount?> Function(GetDiscountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDiscountProvider._internal(
        (ref) => create(ref as GetDiscountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageName: pageName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Discount?> createElement() {
    return _GetDiscountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDiscountProvider && other.pageName == pageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDiscountRef on AutoDisposeFutureProviderRef<Discount?> {
  /// The parameter `pageName` of this provider.
  String get pageName;
}

class _GetDiscountProviderElement
    extends AutoDisposeFutureProviderElement<Discount?> with GetDiscountRef {
  _GetDiscountProviderElement(super.provider);

  @override
  String get pageName => (origin as GetDiscountProvider).pageName;
}

String _$updateBookingMethodHash() =>
    r'652ec3144a915bffa237d390b1b7d78a99e20200';

/// See also [updateBookingMethod].
@ProviderFor(updateBookingMethod)
const updateBookingMethodProvider = UpdateBookingMethodFamily();

/// See also [updateBookingMethod].
class UpdateBookingMethodFamily extends Family<AsyncValue<bool>> {
  /// See also [updateBookingMethod].
  const UpdateBookingMethodFamily();

  /// See also [updateBookingMethod].
  UpdateBookingMethodProvider call({
    required String bookingID,
    required String method,
  }) {
    return UpdateBookingMethodProvider(
      bookingID: bookingID,
      method: method,
    );
  }

  @override
  UpdateBookingMethodProvider getProviderOverride(
    covariant UpdateBookingMethodProvider provider,
  ) {
    return call(
      bookingID: provider.bookingID,
      method: provider.method,
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
  String? get name => r'updateBookingMethodProvider';
}

/// See also [updateBookingMethod].
class UpdateBookingMethodProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateBookingMethod].
  UpdateBookingMethodProvider({
    required String bookingID,
    required String method,
  }) : this._internal(
          (ref) => updateBookingMethod(
            ref as UpdateBookingMethodRef,
            bookingID: bookingID,
            method: method,
          ),
          from: updateBookingMethodProvider,
          name: r'updateBookingMethodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBookingMethodHash,
          dependencies: UpdateBookingMethodFamily._dependencies,
          allTransitiveDependencies:
              UpdateBookingMethodFamily._allTransitiveDependencies,
          bookingID: bookingID,
          method: method,
        );

  UpdateBookingMethodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingID,
    required this.method,
  }) : super.internal();

  final String bookingID;
  final String method;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateBookingMethodRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateBookingMethodProvider._internal(
        (ref) => create(ref as UpdateBookingMethodRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingID: bookingID,
        method: method,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateBookingMethodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBookingMethodProvider &&
        other.bookingID == bookingID &&
        other.method == method;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingID.hashCode);
    hash = _SystemHash.combine(hash, method.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateBookingMethodRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `bookingID` of this provider.
  String get bookingID;

  /// The parameter `method` of this provider.
  String get method;
}

class _UpdateBookingMethodProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateBookingMethodRef {
  _UpdateBookingMethodProviderElement(super.provider);

  @override
  String get bookingID => (origin as UpdateBookingMethodProvider).bookingID;
  @override
  String get method => (origin as UpdateBookingMethodProvider).method;
}

String _$paymentBookingHash() => r'b953b8143c496c836d079e2d3ac3f6a2ac4571d5';

/// See also [paymentBooking].
@ProviderFor(paymentBooking)
const paymentBookingProvider = PaymentBookingFamily();

/// See also [paymentBooking].
class PaymentBookingFamily extends Family<AsyncValue<void>> {
  /// See also [paymentBooking].
  const PaymentBookingFamily();

  /// See also [paymentBooking].
  PaymentBookingProvider call({
    required String bookingID,
  }) {
    return PaymentBookingProvider(
      bookingID: bookingID,
    );
  }

  @override
  PaymentBookingProvider getProviderOverride(
    covariant PaymentBookingProvider provider,
  ) {
    return call(
      bookingID: provider.bookingID,
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
  String? get name => r'paymentBookingProvider';
}

/// See also [paymentBooking].
class PaymentBookingProvider extends AutoDisposeFutureProvider<void> {
  /// See also [paymentBooking].
  PaymentBookingProvider({
    required String bookingID,
  }) : this._internal(
          (ref) => paymentBooking(
            ref as PaymentBookingRef,
            bookingID: bookingID,
          ),
          from: paymentBookingProvider,
          name: r'paymentBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentBookingHash,
          dependencies: PaymentBookingFamily._dependencies,
          allTransitiveDependencies:
              PaymentBookingFamily._allTransitiveDependencies,
          bookingID: bookingID,
        );

  PaymentBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingID,
  }) : super.internal();

  final String bookingID;

  @override
  Override overrideWith(
    FutureOr<void> Function(PaymentBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentBookingProvider._internal(
        (ref) => create(ref as PaymentBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingID: bookingID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PaymentBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentBookingProvider && other.bookingID == bookingID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaymentBookingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `bookingID` of this provider.
  String get bookingID;
}

class _PaymentBookingProviderElement
    extends AutoDisposeFutureProviderElement<void> with PaymentBookingRef {
  _PaymentBookingProviderElement(super.provider);

  @override
  String get bookingID => (origin as PaymentBookingProvider).bookingID;
}

String _$addBookingReviewHash() => r'5931fd8757ad019a75152594845ac6cd2ff18300';

/// See also [addBookingReview].
@ProviderFor(addBookingReview)
const addBookingReviewProvider = AddBookingReviewFamily();

/// See also [addBookingReview].
class AddBookingReviewFamily extends Family<AsyncValue<String>> {
  /// See also [addBookingReview].
  const AddBookingReviewFamily();

  /// See also [addBookingReview].
  AddBookingReviewProvider call({
    required double rating,
    required String comment,
    required String bookingID,
  }) {
    return AddBookingReviewProvider(
      rating: rating,
      comment: comment,
      bookingID: bookingID,
    );
  }

  @override
  AddBookingReviewProvider getProviderOverride(
    covariant AddBookingReviewProvider provider,
  ) {
    return call(
      rating: provider.rating,
      comment: provider.comment,
      bookingID: provider.bookingID,
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
  String? get name => r'addBookingReviewProvider';
}

/// See also [addBookingReview].
class AddBookingReviewProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addBookingReview].
  AddBookingReviewProvider({
    required double rating,
    required String comment,
    required String bookingID,
  }) : this._internal(
          (ref) => addBookingReview(
            ref as AddBookingReviewRef,
            rating: rating,
            comment: comment,
            bookingID: bookingID,
          ),
          from: addBookingReviewProvider,
          name: r'addBookingReviewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addBookingReviewHash,
          dependencies: AddBookingReviewFamily._dependencies,
          allTransitiveDependencies:
              AddBookingReviewFamily._allTransitiveDependencies,
          rating: rating,
          comment: comment,
          bookingID: bookingID,
        );

  AddBookingReviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rating,
    required this.comment,
    required this.bookingID,
  }) : super.internal();

  final double rating;
  final String comment;
  final String bookingID;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddBookingReviewRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddBookingReviewProvider._internal(
        (ref) => create(ref as AddBookingReviewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rating: rating,
        comment: comment,
        bookingID: bookingID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddBookingReviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddBookingReviewProvider &&
        other.rating == rating &&
        other.comment == comment &&
        other.bookingID == bookingID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rating.hashCode);
    hash = _SystemHash.combine(hash, comment.hashCode);
    hash = _SystemHash.combine(hash, bookingID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddBookingReviewRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `rating` of this provider.
  double get rating;

  /// The parameter `comment` of this provider.
  String get comment;

  /// The parameter `bookingID` of this provider.
  String get bookingID;
}

class _AddBookingReviewProviderElement
    extends AutoDisposeFutureProviderElement<String> with AddBookingReviewRef {
  _AddBookingReviewProviderElement(super.provider);

  @override
  double get rating => (origin as AddBookingReviewProvider).rating;
  @override
  String get comment => (origin as AddBookingReviewProvider).comment;
  @override
  String get bookingID => (origin as AddBookingReviewProvider).bookingID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
