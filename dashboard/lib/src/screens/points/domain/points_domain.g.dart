// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPointsHash() => r'51388eef33b1b2b1d515f9f4d609c760136351ea';

/// See also [getPoints].
@ProviderFor(getPoints)
final getPointsProvider = AutoDisposeFutureProvider<List<Point>>.internal(
  getPoints,
  name: r'getPointsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPointsRef = AutoDisposeFutureProviderRef<List<Point>>;
String _$addPointsHash() => r'43b8593b43c42e8b56ddd3058d10b0ce72a69c01';

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

/// See also [addPoints].
@ProviderFor(addPoints)
const addPointsProvider = AddPointsFamily();

/// See also [addPoints].
class AddPointsFamily extends Family<AsyncValue<String?>> {
  /// See also [addPoints].
  const AddPointsFamily();

  /// See also [addPoints].
  AddPointsProvider call({
    required String nameEn,
    required String nameAr,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required int days,
    required bool isActive,
    required int offers,
  }) {
    return AddPointsProvider(
      nameEn: nameEn,
      nameAr: nameAr,
      detailsEn: detailsEn,
      detailsAr: detailsAr,
      points: points,
      days: days,
      isActive: isActive,
      offers: offers,
    );
  }

  @override
  AddPointsProvider getProviderOverride(
    covariant AddPointsProvider provider,
  ) {
    return call(
      nameEn: provider.nameEn,
      nameAr: provider.nameAr,
      detailsEn: provider.detailsEn,
      detailsAr: provider.detailsAr,
      points: provider.points,
      days: provider.days,
      isActive: provider.isActive,
      offers: provider.offers,
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
  String? get name => r'addPointsProvider';
}

/// See also [addPoints].
class AddPointsProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [addPoints].
  AddPointsProvider({
    required String nameEn,
    required String nameAr,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required int days,
    required bool isActive,
    required int offers,
  }) : this._internal(
          (ref) => addPoints(
            ref as AddPointsRef,
            nameEn: nameEn,
            nameAr: nameAr,
            detailsEn: detailsEn,
            detailsAr: detailsAr,
            points: points,
            days: days,
            isActive: isActive,
            offers: offers,
          ),
          from: addPointsProvider,
          name: r'addPointsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addPointsHash,
          dependencies: AddPointsFamily._dependencies,
          allTransitiveDependencies: AddPointsFamily._allTransitiveDependencies,
          nameEn: nameEn,
          nameAr: nameAr,
          detailsEn: detailsEn,
          detailsAr: detailsAr,
          points: points,
          days: days,
          isActive: isActive,
          offers: offers,
        );

  AddPointsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nameEn,
    required this.nameAr,
    required this.detailsEn,
    required this.detailsAr,
    required this.points,
    required this.days,
    required this.isActive,
    required this.offers,
  }) : super.internal();

  final String nameEn;
  final String nameAr;
  final String detailsEn;
  final String detailsAr;
  final int points;
  final int days;
  final bool isActive;
  final int offers;

  @override
  Override overrideWith(
    FutureOr<String?> Function(AddPointsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddPointsProvider._internal(
        (ref) => create(ref as AddPointsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nameEn: nameEn,
        nameAr: nameAr,
        detailsEn: detailsEn,
        detailsAr: detailsAr,
        points: points,
        days: days,
        isActive: isActive,
        offers: offers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _AddPointsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPointsProvider &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.detailsEn == detailsEn &&
        other.detailsAr == detailsAr &&
        other.points == points &&
        other.days == days &&
        other.isActive == isActive &&
        other.offers == offers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nameEn.hashCode);
    hash = _SystemHash.combine(hash, nameAr.hashCode);
    hash = _SystemHash.combine(hash, detailsEn.hashCode);
    hash = _SystemHash.combine(hash, detailsAr.hashCode);
    hash = _SystemHash.combine(hash, points.hashCode);
    hash = _SystemHash.combine(hash, days.hashCode);
    hash = _SystemHash.combine(hash, isActive.hashCode);
    hash = _SystemHash.combine(hash, offers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddPointsRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `nameEn` of this provider.
  String get nameEn;

  /// The parameter `nameAr` of this provider.
  String get nameAr;

  /// The parameter `detailsEn` of this provider.
  String get detailsEn;

  /// The parameter `detailsAr` of this provider.
  String get detailsAr;

  /// The parameter `points` of this provider.
  int get points;

  /// The parameter `days` of this provider.
  int get days;

  /// The parameter `isActive` of this provider.
  bool get isActive;

  /// The parameter `offers` of this provider.
  int get offers;
}

class _AddPointsProviderElement
    extends AutoDisposeFutureProviderElement<String?> with AddPointsRef {
  _AddPointsProviderElement(super.provider);

  @override
  String get nameEn => (origin as AddPointsProvider).nameEn;
  @override
  String get nameAr => (origin as AddPointsProvider).nameAr;
  @override
  String get detailsEn => (origin as AddPointsProvider).detailsEn;
  @override
  String get detailsAr => (origin as AddPointsProvider).detailsAr;
  @override
  int get points => (origin as AddPointsProvider).points;
  @override
  int get days => (origin as AddPointsProvider).days;
  @override
  bool get isActive => (origin as AddPointsProvider).isActive;
  @override
  int get offers => (origin as AddPointsProvider).offers;
}

String _$updatePointHash() => r'4194df2d611db449a431909f66e24f823ccb3846';

/// See also [updatePoint].
@ProviderFor(updatePoint)
const updatePointProvider = UpdatePointFamily();

/// See also [updatePoint].
class UpdatePointFamily extends Family<AsyncValue<String?>> {
  /// See also [updatePoint].
  const UpdatePointFamily();

  /// See also [updatePoint].
  UpdatePointProvider call({
    required String nameEn,
    required String nameAr,
    required String id,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required bool isActive,
    required int days,
    required int offers,
  }) {
    return UpdatePointProvider(
      nameEn: nameEn,
      nameAr: nameAr,
      id: id,
      detailsEn: detailsEn,
      detailsAr: detailsAr,
      points: points,
      isActive: isActive,
      days: days,
      offers: offers,
    );
  }

  @override
  UpdatePointProvider getProviderOverride(
    covariant UpdatePointProvider provider,
  ) {
    return call(
      nameEn: provider.nameEn,
      nameAr: provider.nameAr,
      id: provider.id,
      detailsEn: provider.detailsEn,
      detailsAr: provider.detailsAr,
      points: provider.points,
      isActive: provider.isActive,
      days: provider.days,
      offers: provider.offers,
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
  String? get name => r'updatePointProvider';
}

/// See also [updatePoint].
class UpdatePointProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [updatePoint].
  UpdatePointProvider({
    required String nameEn,
    required String nameAr,
    required String id,
    required String detailsEn,
    required String detailsAr,
    required int points,
    required bool isActive,
    required int days,
    required int offers,
  }) : this._internal(
          (ref) => updatePoint(
            ref as UpdatePointRef,
            nameEn: nameEn,
            nameAr: nameAr,
            id: id,
            detailsEn: detailsEn,
            detailsAr: detailsAr,
            points: points,
            isActive: isActive,
            days: days,
            offers: offers,
          ),
          from: updatePointProvider,
          name: r'updatePointProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePointHash,
          dependencies: UpdatePointFamily._dependencies,
          allTransitiveDependencies:
              UpdatePointFamily._allTransitiveDependencies,
          nameEn: nameEn,
          nameAr: nameAr,
          id: id,
          detailsEn: detailsEn,
          detailsAr: detailsAr,
          points: points,
          isActive: isActive,
          days: days,
          offers: offers,
        );

  UpdatePointProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nameEn,
    required this.nameAr,
    required this.id,
    required this.detailsEn,
    required this.detailsAr,
    required this.points,
    required this.isActive,
    required this.days,
    required this.offers,
  }) : super.internal();

  final String nameEn;
  final String nameAr;
  final String id;
  final String detailsEn;
  final String detailsAr;
  final int points;
  final bool isActive;
  final int days;
  final int offers;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UpdatePointRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePointProvider._internal(
        (ref) => create(ref as UpdatePointRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nameEn: nameEn,
        nameAr: nameAr,
        id: id,
        detailsEn: detailsEn,
        detailsAr: detailsAr,
        points: points,
        isActive: isActive,
        days: days,
        offers: offers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UpdatePointProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePointProvider &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.id == id &&
        other.detailsEn == detailsEn &&
        other.detailsAr == detailsAr &&
        other.points == points &&
        other.isActive == isActive &&
        other.days == days &&
        other.offers == offers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nameEn.hashCode);
    hash = _SystemHash.combine(hash, nameAr.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, detailsEn.hashCode);
    hash = _SystemHash.combine(hash, detailsAr.hashCode);
    hash = _SystemHash.combine(hash, points.hashCode);
    hash = _SystemHash.combine(hash, isActive.hashCode);
    hash = _SystemHash.combine(hash, days.hashCode);
    hash = _SystemHash.combine(hash, offers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdatePointRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `nameEn` of this provider.
  String get nameEn;

  /// The parameter `nameAr` of this provider.
  String get nameAr;

  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `detailsEn` of this provider.
  String get detailsEn;

  /// The parameter `detailsAr` of this provider.
  String get detailsAr;

  /// The parameter `points` of this provider.
  int get points;

  /// The parameter `isActive` of this provider.
  bool get isActive;

  /// The parameter `days` of this provider.
  int get days;

  /// The parameter `offers` of this provider.
  int get offers;
}

class _UpdatePointProviderElement
    extends AutoDisposeFutureProviderElement<String?> with UpdatePointRef {
  _UpdatePointProviderElement(super.provider);

  @override
  String get nameEn => (origin as UpdatePointProvider).nameEn;
  @override
  String get nameAr => (origin as UpdatePointProvider).nameAr;
  @override
  String get id => (origin as UpdatePointProvider).id;
  @override
  String get detailsEn => (origin as UpdatePointProvider).detailsEn;
  @override
  String get detailsAr => (origin as UpdatePointProvider).detailsAr;
  @override
  int get points => (origin as UpdatePointProvider).points;
  @override
  bool get isActive => (origin as UpdatePointProvider).isActive;
  @override
  int get days => (origin as UpdatePointProvider).days;
  @override
  int get offers => (origin as UpdatePointProvider).offers;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
