// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addBookingHash() => r'b331520ea2021079742b0990e3689943e520ed4e';

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
    required List<String> images,
  }) {
    return AddBookingProvider(
      services: services,
      date: date,
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
    required List<String> images,
  }) : this._internal(
          (ref) => addBooking(
            ref as AddBookingRef,
            services: services,
            date: date,
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
    required this.images,
  }) : super.internal();

  final List<String> services;
  final DateTime date;
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
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, services.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
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
  List<String> get images => (origin as AddBookingProvider).images;
}

String _$updateCustomerHash() => r'2e729dcf45aa48c69fad9270399a91bba2599a12';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
