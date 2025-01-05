// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAdsHash() => r'a80e72c9e32373100b47d4e0e9578826211b71ef';

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

/// See also [getAds].
@ProviderFor(getAds)
const getAdsProvider = GetAdsFamily();

/// See also [getAds].
class GetAdsFamily extends Family<AsyncValue<List<Ad>>> {
  /// See also [getAds].
  const GetAdsFamily();

  /// See also [getAds].
  GetAdsProvider call({
    AdsType type = AdsType.slider,
  }) {
    return GetAdsProvider(
      type: type,
    );
  }

  @override
  GetAdsProvider getProviderOverride(
    covariant GetAdsProvider provider,
  ) {
    return call(
      type: provider.type,
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
  String? get name => r'getAdsProvider';
}

/// See also [getAds].
class GetAdsProvider extends AutoDisposeFutureProvider<List<Ad>> {
  /// See also [getAds].
  GetAdsProvider({
    AdsType type = AdsType.slider,
  }) : this._internal(
          (ref) => getAds(
            ref as GetAdsRef,
            type: type,
          ),
          from: getAdsProvider,
          name: r'getAdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAdsHash,
          dependencies: GetAdsFamily._dependencies,
          allTransitiveDependencies: GetAdsFamily._allTransitiveDependencies,
          type: type,
        );

  GetAdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final AdsType type;

  @override
  Override overrideWith(
    FutureOr<List<Ad>> Function(GetAdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAdsProvider._internal(
        (ref) => create(ref as GetAdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Ad>> createElement() {
    return _GetAdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAdsProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAdsRef on AutoDisposeFutureProviderRef<List<Ad>> {
  /// The parameter `type` of this provider.
  AdsType get type;
}

class _GetAdsProviderElement extends AutoDisposeFutureProviderElement<List<Ad>>
    with GetAdsRef {
  _GetAdsProviderElement(super.provider);

  @override
  AdsType get type => (origin as GetAdsProvider).type;
}

String _$getAllServicesHash() => r'e5f214ae3bbd4497c94e39edf67287309b21ddfe';

/// See also [getAllServices].
@ProviderFor(getAllServices)
const getAllServicesProvider = GetAllServicesFamily();

/// See also [getAllServices].
class GetAllServicesFamily extends Family<AsyncValue<List<Service>>> {
  /// See also [getAllServices].
  const GetAllServicesFamily();

  /// See also [getAllServices].
  GetAllServicesProvider call({
    String? query,
  }) {
    return GetAllServicesProvider(
      query: query,
    );
  }

  @override
  GetAllServicesProvider getProviderOverride(
    covariant GetAllServicesProvider provider,
  ) {
    return call(
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
  String? get name => r'getAllServicesProvider';
}

/// See also [getAllServices].
class GetAllServicesProvider extends AutoDisposeFutureProvider<List<Service>> {
  /// See also [getAllServices].
  GetAllServicesProvider({
    String? query,
  }) : this._internal(
          (ref) => getAllServices(
            ref as GetAllServicesRef,
            query: query,
          ),
          from: getAllServicesProvider,
          name: r'getAllServicesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllServicesHash,
          dependencies: GetAllServicesFamily._dependencies,
          allTransitiveDependencies:
              GetAllServicesFamily._allTransitiveDependencies,
          query: query,
        );

  GetAllServicesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String? query;

  @override
  Override overrideWith(
    FutureOr<List<Service>> Function(GetAllServicesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllServicesProvider._internal(
        (ref) => create(ref as GetAllServicesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Service>> createElement() {
    return _GetAllServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllServicesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllServicesRef on AutoDisposeFutureProviderRef<List<Service>> {
  /// The parameter `query` of this provider.
  String? get query;
}

class _GetAllServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<Service>>
    with GetAllServicesRef {
  _GetAllServicesProviderElement(super.provider);

  @override
  String? get query => (origin as GetAllServicesProvider).query;
}

String _$getSubServicesHash() => r'54e90d503fae293cc8d162d7e56b92964e88d61f';

/// See also [getSubServices].
@ProviderFor(getSubServices)
const getSubServicesProvider = GetSubServicesFamily();

/// See also [getSubServices].
class GetSubServicesFamily extends Family<AsyncValue<List<Service>>> {
  /// See also [getSubServices].
  const GetSubServicesFamily();

  /// See also [getSubServices].
  GetSubServicesProvider call({
    String? type,
  }) {
    return GetSubServicesProvider(
      type: type,
    );
  }

  @override
  GetSubServicesProvider getProviderOverride(
    covariant GetSubServicesProvider provider,
  ) {
    return call(
      type: provider.type,
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
  String? get name => r'getSubServicesProvider';
}

/// See also [getSubServices].
class GetSubServicesProvider extends AutoDisposeFutureProvider<List<Service>> {
  /// See also [getSubServices].
  GetSubServicesProvider({
    String? type,
  }) : this._internal(
          (ref) => getSubServices(
            ref as GetSubServicesRef,
            type: type,
          ),
          from: getSubServicesProvider,
          name: r'getSubServicesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSubServicesHash,
          dependencies: GetSubServicesFamily._dependencies,
          allTransitiveDependencies:
              GetSubServicesFamily._allTransitiveDependencies,
          type: type,
        );

  GetSubServicesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String? type;

  @override
  Override overrideWith(
    FutureOr<List<Service>> Function(GetSubServicesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSubServicesProvider._internal(
        (ref) => create(ref as GetSubServicesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Service>> createElement() {
    return _GetSubServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSubServicesProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetSubServicesRef on AutoDisposeFutureProviderRef<List<Service>> {
  /// The parameter `type` of this provider.
  String? get type;
}

class _GetSubServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<Service>>
    with GetSubServicesRef {
  _GetSubServicesProviderElement(super.provider);

  @override
  String? get type => (origin as GetSubServicesProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
