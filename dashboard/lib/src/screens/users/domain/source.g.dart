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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
