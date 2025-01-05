// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserPointsHash() => r'1f19a26529bd5b3cee44456de20b34896ded653f';

/// See also [getUserPoints].
@ProviderFor(getUserPoints)
final getUserPointsProvider = AutoDisposeFutureProvider<List<Point>>.internal(
  getUserPoints,
  name: r'getUserPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserPointsRef = AutoDisposeFutureProviderRef<List<Point>>;
String _$claimPointsHash() => r'0d2a6f50d62f2a1010075685dc595088251fd870';

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

/// See also [claimPoints].
@ProviderFor(claimPoints)
const claimPointsProvider = ClaimPointsFamily();

/// See also [claimPoints].
class ClaimPointsFamily extends Family<AsyncValue<int>> {
  /// See also [claimPoints].
  const ClaimPointsFamily();

  /// See also [claimPoints].
  ClaimPointsProvider call({
    required String pointsID,
  }) {
    return ClaimPointsProvider(
      pointsID: pointsID,
    );
  }

  @override
  ClaimPointsProvider getProviderOverride(
    covariant ClaimPointsProvider provider,
  ) {
    return call(
      pointsID: provider.pointsID,
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
  String? get name => r'claimPointsProvider';
}

/// See also [claimPoints].
class ClaimPointsProvider extends AutoDisposeFutureProvider<int> {
  /// See also [claimPoints].
  ClaimPointsProvider({
    required String pointsID,
  }) : this._internal(
          (ref) => claimPoints(
            ref as ClaimPointsRef,
            pointsID: pointsID,
          ),
          from: claimPointsProvider,
          name: r'claimPointsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$claimPointsHash,
          dependencies: ClaimPointsFamily._dependencies,
          allTransitiveDependencies:
              ClaimPointsFamily._allTransitiveDependencies,
          pointsID: pointsID,
        );

  ClaimPointsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pointsID,
  }) : super.internal();

  final String pointsID;

  @override
  Override overrideWith(
    FutureOr<int> Function(ClaimPointsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClaimPointsProvider._internal(
        (ref) => create(ref as ClaimPointsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pointsID: pointsID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _ClaimPointsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClaimPointsProvider && other.pointsID == pointsID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pointsID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClaimPointsRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `pointsID` of this provider.
  String get pointsID;
}

class _ClaimPointsProviderElement extends AutoDisposeFutureProviderElement<int>
    with ClaimPointsRef {
  _ClaimPointsProviderElement(super.provider);

  @override
  String get pointsID => (origin as ClaimPointsProvider).pointsID;
}

String _$getCustomerOfferHash() => r'1b6f3a326543dce04f17667f1b0d2d2ded99ce73';

/// See also [getCustomerOffer].
@ProviderFor(getCustomerOffer)
final getCustomerOfferProvider = AutoDisposeFutureProvider<Offer>.internal(
  getCustomerOffer,
  name: r'getCustomerOfferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCustomerOfferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCustomerOfferRef = AutoDisposeFutureProviderRef<Offer>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
