// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addAdsHash() => r'6601946bb06660c38fea5bd271dc1d4f7853a0d3';

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

/// See also [addAds].
@ProviderFor(addAds)
const addAdsProvider = AddAdsFamily();

/// See also [addAds].
class AddAdsFamily extends Family<AsyncValue<String>> {
  /// See also [addAds].
  const AddAdsFamily();

  /// See also [addAds].
  AddAdsProvider call({
    required Uint8List image,
    required AdsType type,
  }) {
    return AddAdsProvider(
      image: image,
      type: type,
    );
  }

  @override
  AddAdsProvider getProviderOverride(
    covariant AddAdsProvider provider,
  ) {
    return call(
      image: provider.image,
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
  String? get name => r'addAdsProvider';
}

/// See also [addAds].
class AddAdsProvider extends AutoDisposeFutureProvider<String> {
  /// See also [addAds].
  AddAdsProvider({
    required Uint8List image,
    required AdsType type,
  }) : this._internal(
          (ref) => addAds(
            ref as AddAdsRef,
            image: image,
            type: type,
          ),
          from: addAdsProvider,
          name: r'addAdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAdsHash,
          dependencies: AddAdsFamily._dependencies,
          allTransitiveDependencies: AddAdsFamily._allTransitiveDependencies,
          image: image,
          type: type,
        );

  AddAdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.image,
    required this.type,
  }) : super.internal();

  final Uint8List image;
  final AdsType type;

  @override
  Override overrideWith(
    FutureOr<String> Function(AddAdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAdsProvider._internal(
        (ref) => create(ref as AddAdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        image: image,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _AddAdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAdsProvider &&
        other.image == image &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddAdsRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `image` of this provider.
  Uint8List get image;

  /// The parameter `type` of this provider.
  AdsType get type;
}

class _AddAdsProviderElement extends AutoDisposeFutureProviderElement<String>
    with AddAdsRef {
  _AddAdsProviderElement(super.provider);

  @override
  Uint8List get image => (origin as AddAdsProvider).image;
  @override
  AdsType get type => (origin as AddAdsProvider).type;
}

String _$getAdsHash() => r'77d2b7a3fbf8776f71a885fd1cd8e83b70994429';

/// See also [getAds].
@ProviderFor(getAds)
const getAdsProvider = GetAdsFamily();

/// See also [getAds].
class GetAdsFamily extends Family<AsyncValue<List<Ad>>> {
  /// See also [getAds].
  const GetAdsFamily();

  /// See also [getAds].
  GetAdsProvider call({
    AdsType? type,
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
    AdsType? type,
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

  final AdsType? type;

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
  AdsType? get type;
}

class _GetAdsProviderElement extends AutoDisposeFutureProviderElement<List<Ad>>
    with GetAdsRef {
  _GetAdsProviderElement(super.provider);

  @override
  AdsType? get type => (origin as GetAdsProvider).type;
}

String _$getAdsByIdHash() => r'f20983f4a7cd3a5b01f586a7d98d286287c8c440';

/// See also [getAdsById].
@ProviderFor(getAdsById)
const getAdsByIdProvider = GetAdsByIdFamily();

/// See also [getAdsById].
class GetAdsByIdFamily extends Family<AsyncValue<Either<String, Ad>>> {
  /// See also [getAdsById].
  const GetAdsByIdFamily();

  /// See also [getAdsById].
  GetAdsByIdProvider call({
    required String id,
  }) {
    return GetAdsByIdProvider(
      id: id,
    );
  }

  @override
  GetAdsByIdProvider getProviderOverride(
    covariant GetAdsByIdProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getAdsByIdProvider';
}

/// See also [getAdsById].
class GetAdsByIdProvider extends AutoDisposeFutureProvider<Either<String, Ad>> {
  /// See also [getAdsById].
  GetAdsByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => getAdsById(
            ref as GetAdsByIdRef,
            id: id,
          ),
          from: getAdsByIdProvider,
          name: r'getAdsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAdsByIdHash,
          dependencies: GetAdsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetAdsByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetAdsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Either<String, Ad>> Function(GetAdsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAdsByIdProvider._internal(
        (ref) => create(ref as GetAdsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<String, Ad>> createElement() {
    return _GetAdsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAdsByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAdsByIdRef on AutoDisposeFutureProviderRef<Either<String, Ad>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetAdsByIdProviderElement
    extends AutoDisposeFutureProviderElement<Either<String, Ad>>
    with GetAdsByIdRef {
  _GetAdsByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetAdsByIdProvider).id;
}

String _$updateAdsByIdHash() => r'7b085638820d703dac40eff75e71eb75cb2be8f2';

/// See also [updateAdsById].
@ProviderFor(updateAdsById)
const updateAdsByIdProvider = UpdateAdsByIdFamily();

/// See also [updateAdsById].
class UpdateAdsByIdFamily extends Family<AsyncValue<String?>> {
  /// See also [updateAdsById].
  const UpdateAdsByIdFamily();

  /// See also [updateAdsById].
  UpdateAdsByIdProvider call({
    required String id,
    required String type,
    required Uint8List image,
  }) {
    return UpdateAdsByIdProvider(
      id: id,
      type: type,
      image: image,
    );
  }

  @override
  UpdateAdsByIdProvider getProviderOverride(
    covariant UpdateAdsByIdProvider provider,
  ) {
    return call(
      id: provider.id,
      type: provider.type,
      image: provider.image,
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
  String? get name => r'updateAdsByIdProvider';
}

/// See also [updateAdsById].
class UpdateAdsByIdProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [updateAdsById].
  UpdateAdsByIdProvider({
    required String id,
    required String type,
    required Uint8List image,
  }) : this._internal(
          (ref) => updateAdsById(
            ref as UpdateAdsByIdRef,
            id: id,
            type: type,
            image: image,
          ),
          from: updateAdsByIdProvider,
          name: r'updateAdsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAdsByIdHash,
          dependencies: UpdateAdsByIdFamily._dependencies,
          allTransitiveDependencies:
              UpdateAdsByIdFamily._allTransitiveDependencies,
          id: id,
          type: type,
          image: image,
        );

  UpdateAdsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.type,
    required this.image,
  }) : super.internal();

  final String id;
  final String type;
  final Uint8List image;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UpdateAdsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAdsByIdProvider._internal(
        (ref) => create(ref as UpdateAdsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        type: type,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UpdateAdsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAdsByIdProvider &&
        other.id == id &&
        other.type == type &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateAdsByIdRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `type` of this provider.
  String get type;

  /// The parameter `image` of this provider.
  Uint8List get image;
}

class _UpdateAdsByIdProviderElement
    extends AutoDisposeFutureProviderElement<String?> with UpdateAdsByIdRef {
  _UpdateAdsByIdProviderElement(super.provider);

  @override
  String get id => (origin as UpdateAdsByIdProvider).id;
  @override
  String get type => (origin as UpdateAdsByIdProvider).type;
  @override
  Uint8List get image => (origin as UpdateAdsByIdProvider).image;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
