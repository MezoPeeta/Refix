// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPointsHash() => r'fe1862d4f81fd6f2862e9938eaf832254b70cca2';

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

/// See also [getPoints].
@ProviderFor(getPoints)
const getPointsProvider = GetPointsFamily();

/// See also [getPoints].
class GetPointsFamily extends Family<AsyncValue<List<User>>> {
  /// See also [getPoints].
  const GetPointsFamily();

  /// See also [getPoints].
  GetPointsProvider call({
    required int page,
    String? query,
  }) {
    return GetPointsProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetPointsProvider getProviderOverride(
    covariant GetPointsProvider provider,
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
  String? get name => r'getPointsProvider';
}

/// See also [getPoints].
class GetPointsProvider extends AutoDisposeFutureProvider<List<User>> {
  /// See also [getPoints].
  GetPointsProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getPoints(
            ref as GetPointsRef,
            page: page,
            query: query,
          ),
          from: getPointsProvider,
          name: r'getPointsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPointsHash,
          dependencies: GetPointsFamily._dependencies,
          allTransitiveDependencies: GetPointsFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetPointsProvider._internal(
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
    FutureOr<List<User>> Function(GetPointsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPointsProvider._internal(
        (ref) => create(ref as GetPointsRef),
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
    return _GetPointsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPointsProvider &&
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
mixin GetPointsRef on AutoDisposeFutureProviderRef<List<User>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetPointsProviderElement
    extends AutoDisposeFutureProviderElement<List<User>> with GetPointsRef {
  _GetPointsProviderElement(super.provider);

  @override
  int get page => (origin as GetPointsProvider).page;
  @override
  String? get query => (origin as GetPointsProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
