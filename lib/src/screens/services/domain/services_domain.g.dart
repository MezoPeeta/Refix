// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAvgReviewsHash() => r'c26f37299a32162d044d4c16df6e128e32a17838';

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

/// See also [getAvgReviews].
@ProviderFor(getAvgReviews)
const getAvgReviewsProvider = GetAvgReviewsFamily();

/// See also [getAvgReviews].
class GetAvgReviewsFamily extends Family<AsyncValue<double>> {
  /// See also [getAvgReviews].
  const GetAvgReviewsFamily();

  /// See also [getAvgReviews].
  GetAvgReviewsProvider call({
    required String type,
  }) {
    return GetAvgReviewsProvider(
      type: type,
    );
  }

  @override
  GetAvgReviewsProvider getProviderOverride(
    covariant GetAvgReviewsProvider provider,
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
  String? get name => r'getAvgReviewsProvider';
}

/// See also [getAvgReviews].
class GetAvgReviewsProvider extends AutoDisposeFutureProvider<double> {
  /// See also [getAvgReviews].
  GetAvgReviewsProvider({
    required String type,
  }) : this._internal(
          (ref) => getAvgReviews(
            ref as GetAvgReviewsRef,
            type: type,
          ),
          from: getAvgReviewsProvider,
          name: r'getAvgReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAvgReviewsHash,
          dependencies: GetAvgReviewsFamily._dependencies,
          allTransitiveDependencies:
              GetAvgReviewsFamily._allTransitiveDependencies,
          type: type,
        );

  GetAvgReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  Override overrideWith(
    FutureOr<double> Function(GetAvgReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAvgReviewsProvider._internal(
        (ref) => create(ref as GetAvgReviewsRef),
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
  AutoDisposeFutureProviderElement<double> createElement() {
    return _GetAvgReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAvgReviewsProvider && other.type == type;
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
mixin GetAvgReviewsRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `type` of this provider.
  String get type;
}

class _GetAvgReviewsProviderElement
    extends AutoDisposeFutureProviderElement<double> with GetAvgReviewsRef {
  _GetAvgReviewsProviderElement(super.provider);

  @override
  String get type => (origin as GetAvgReviewsProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
