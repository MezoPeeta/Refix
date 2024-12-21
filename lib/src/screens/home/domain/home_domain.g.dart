// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAdsHash() => r'baad38897d166a3c8073f55279da03eea354c79b';

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

String _$getAllServicesHash() => r'37ce927dd9574c5b74ca156d675172cee7a79412';

/// See also [getAllServices].
@ProviderFor(getAllServices)
final getAllServicesProvider =
    AutoDisposeFutureProvider<List<Service>>.internal(
  getAllServices,
  name: r'getAllServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllServicesRef = AutoDisposeFutureProviderRef<List<Service>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
