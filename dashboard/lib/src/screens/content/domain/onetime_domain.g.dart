// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onetime_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateBoardingHash() => r'edeb05ed732807cb02a98f76909fd0f40d383fe5';

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

/// See also [updateBoarding].
@ProviderFor(updateBoarding)
const updateBoardingProvider = UpdateBoardingFamily();

/// See also [updateBoarding].
class UpdateBoardingFamily extends Family<AsyncValue<Either<String, String>>> {
  /// See also [updateBoarding].
  const UpdateBoardingFamily();

  /// See also [updateBoarding].
  UpdateBoardingProvider call({
    required String id,
    required String headingEn,
    required String headingAr,
    required String detailsEn,
    required String detailsAr,
    required Uint8List image,
  }) {
    return UpdateBoardingProvider(
      id: id,
      headingEn: headingEn,
      headingAr: headingAr,
      detailsEn: detailsEn,
      detailsAr: detailsAr,
      image: image,
    );
  }

  @override
  UpdateBoardingProvider getProviderOverride(
    covariant UpdateBoardingProvider provider,
  ) {
    return call(
      id: provider.id,
      headingEn: provider.headingEn,
      headingAr: provider.headingAr,
      detailsEn: provider.detailsEn,
      detailsAr: provider.detailsAr,
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
  String? get name => r'updateBoardingProvider';
}

/// See also [updateBoarding].
class UpdateBoardingProvider
    extends AutoDisposeFutureProvider<Either<String, String>> {
  /// See also [updateBoarding].
  UpdateBoardingProvider({
    required String id,
    required String headingEn,
    required String headingAr,
    required String detailsEn,
    required String detailsAr,
    required Uint8List image,
  }) : this._internal(
          (ref) => updateBoarding(
            ref as UpdateBoardingRef,
            id: id,
            headingEn: headingEn,
            headingAr: headingAr,
            detailsEn: detailsEn,
            detailsAr: detailsAr,
            image: image,
          ),
          from: updateBoardingProvider,
          name: r'updateBoardingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBoardingHash,
          dependencies: UpdateBoardingFamily._dependencies,
          allTransitiveDependencies:
              UpdateBoardingFamily._allTransitiveDependencies,
          id: id,
          headingEn: headingEn,
          headingAr: headingAr,
          detailsEn: detailsEn,
          detailsAr: detailsAr,
          image: image,
        );

  UpdateBoardingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.headingEn,
    required this.headingAr,
    required this.detailsEn,
    required this.detailsAr,
    required this.image,
  }) : super.internal();

  final String id;
  final String headingEn;
  final String headingAr;
  final String detailsEn;
  final String detailsAr;
  final Uint8List image;

  @override
  Override overrideWith(
    FutureOr<Either<String, String>> Function(UpdateBoardingRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateBoardingProvider._internal(
        (ref) => create(ref as UpdateBoardingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        headingEn: headingEn,
        headingAr: headingAr,
        detailsEn: detailsEn,
        detailsAr: detailsAr,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<String, String>> createElement() {
    return _UpdateBoardingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBoardingProvider &&
        other.id == id &&
        other.headingEn == headingEn &&
        other.headingAr == headingAr &&
        other.detailsEn == detailsEn &&
        other.detailsAr == detailsAr &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, headingEn.hashCode);
    hash = _SystemHash.combine(hash, headingAr.hashCode);
    hash = _SystemHash.combine(hash, detailsEn.hashCode);
    hash = _SystemHash.combine(hash, detailsAr.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateBoardingRef
    on AutoDisposeFutureProviderRef<Either<String, String>> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `headingEn` of this provider.
  String get headingEn;

  /// The parameter `headingAr` of this provider.
  String get headingAr;

  /// The parameter `detailsEn` of this provider.
  String get detailsEn;

  /// The parameter `detailsAr` of this provider.
  String get detailsAr;

  /// The parameter `image` of this provider.
  Uint8List get image;
}

class _UpdateBoardingProviderElement
    extends AutoDisposeFutureProviderElement<Either<String, String>>
    with UpdateBoardingRef {
  _UpdateBoardingProviderElement(super.provider);

  @override
  String get id => (origin as UpdateBoardingProvider).id;
  @override
  String get headingEn => (origin as UpdateBoardingProvider).headingEn;
  @override
  String get headingAr => (origin as UpdateBoardingProvider).headingAr;
  @override
  String get detailsEn => (origin as UpdateBoardingProvider).detailsEn;
  @override
  String get detailsAr => (origin as UpdateBoardingProvider).detailsAr;
  @override
  Uint8List get image => (origin as UpdateBoardingProvider).image;
}

String _$getBoardingHash() => r'413fcbc39ef169253eaed0f7068677e63f4b2ea6';

/// See also [getBoarding].
@ProviderFor(getBoarding)
final getBoardingProvider = AutoDisposeFutureProvider<List<Boarding>>.internal(
  getBoarding,
  name: r'getBoardingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBoardingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetBoardingRef = AutoDisposeFutureProviderRef<List<Boarding>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
