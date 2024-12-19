// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addBookingHash() => r'b123e79e314c00d4c75ddeaaea18737f5e8a4fc9';

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
class AddBookingFamily extends Family<AsyncValue<Either<String, String>>> {
  /// See also [addBooking].
  const AddBookingFamily();

  /// See also [addBooking].
  AddBookingProvider call({
    required List<String> services,
    required DateTime date,
  }) {
    return AddBookingProvider(
      services: services,
      date: date,
    );
  }

  @override
  AddBookingProvider getProviderOverride(
    covariant AddBookingProvider provider,
  ) {
    return call(
      services: provider.services,
      date: provider.date,
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
class AddBookingProvider
    extends AutoDisposeFutureProvider<Either<String, String>> {
  /// See also [addBooking].
  AddBookingProvider({
    required List<String> services,
    required DateTime date,
  }) : this._internal(
          (ref) => addBooking(
            ref as AddBookingRef,
            services: services,
            date: date,
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
  }) : super.internal();

  final List<String> services;
  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<Either<String, String>> Function(AddBookingRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<String, String>> createElement() {
    return _AddBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddBookingProvider &&
        other.services == services &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, services.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddBookingRef on AutoDisposeFutureProviderRef<Either<String, String>> {
  /// The parameter `services` of this provider.
  List<String> get services;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _AddBookingProviderElement
    extends AutoDisposeFutureProviderElement<Either<String, String>>
    with AddBookingRef {
  _AddBookingProviderElement(super.provider);

  @override
  List<String> get services => (origin as AddBookingProvider).services;
  @override
  DateTime get date => (origin as AddBookingProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
