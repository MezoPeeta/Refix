// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getRatesHash() => r'2a1d890dba85a73e9141837bf45650c52900731e';

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

/// See also [getRates].
@ProviderFor(getRates)
const getRatesProvider = GetRatesFamily();

/// See also [getRates].
class GetRatesFamily extends Family<AsyncValue<List<Reviews>>> {
  /// See also [getRates].
  const GetRatesFamily();

  /// See also [getRates].
  GetRatesProvider call({
    required int page,
    String? query,
  }) {
    return GetRatesProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetRatesProvider getProviderOverride(
    covariant GetRatesProvider provider,
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
  String? get name => r'getRatesProvider';
}

/// See also [getRates].
class GetRatesProvider extends AutoDisposeFutureProvider<List<Reviews>> {
  /// See also [getRates].
  GetRatesProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getRates(
            ref as GetRatesRef,
            page: page,
            query: query,
          ),
          from: getRatesProvider,
          name: r'getRatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRatesHash,
          dependencies: GetRatesFamily._dependencies,
          allTransitiveDependencies: GetRatesFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetRatesProvider._internal(
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
    FutureOr<List<Reviews>> Function(GetRatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRatesProvider._internal(
        (ref) => create(ref as GetRatesRef),
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
  AutoDisposeFutureProviderElement<List<Reviews>> createElement() {
    return _GetRatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRatesProvider &&
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
mixin GetRatesRef on AutoDisposeFutureProviderRef<List<Reviews>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetRatesProviderElement
    extends AutoDisposeFutureProviderElement<List<Reviews>> with GetRatesRef {
  _GetRatesProviderElement(super.provider);

  @override
  int get page => (origin as GetRatesProvider).page;
  @override
  String? get query => (origin as GetRatesProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
