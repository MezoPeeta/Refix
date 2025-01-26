// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDiscountsHash() => r'1620d238836102471c02d35bef5b969915252601';

/// See also [getDiscounts].
@ProviderFor(getDiscounts)
final getDiscountsProvider = AutoDisposeFutureProvider<List<Discount>>.internal(
  getDiscounts,
  name: r'getDiscountsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDiscountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDiscountsRef = AutoDisposeFutureProviderRef<List<Discount>>;
String _$updateDiscountHash() => r'a0e1e76dd92b153c342a502e1e629ed189d59741';

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

/// See also [updateDiscount].
@ProviderFor(updateDiscount)
const updateDiscountProvider = UpdateDiscountFamily();

/// See also [updateDiscount].
class UpdateDiscountFamily extends Family<AsyncValue<String?>> {
  /// See also [updateDiscount].
  const UpdateDiscountFamily();

  /// See also [updateDiscount].
  UpdateDiscountProvider call({
    required Discount discount,
  }) {
    return UpdateDiscountProvider(
      discount: discount,
    );
  }

  @override
  UpdateDiscountProvider getProviderOverride(
    covariant UpdateDiscountProvider provider,
  ) {
    return call(
      discount: provider.discount,
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
  String? get name => r'updateDiscountProvider';
}

/// See also [updateDiscount].
class UpdateDiscountProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [updateDiscount].
  UpdateDiscountProvider({
    required Discount discount,
  }) : this._internal(
          (ref) => updateDiscount(
            ref as UpdateDiscountRef,
            discount: discount,
          ),
          from: updateDiscountProvider,
          name: r'updateDiscountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDiscountHash,
          dependencies: UpdateDiscountFamily._dependencies,
          allTransitiveDependencies:
              UpdateDiscountFamily._allTransitiveDependencies,
          discount: discount,
        );

  UpdateDiscountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.discount,
  }) : super.internal();

  final Discount discount;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UpdateDiscountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateDiscountProvider._internal(
        (ref) => create(ref as UpdateDiscountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        discount: discount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UpdateDiscountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDiscountProvider && other.discount == discount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, discount.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateDiscountRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `discount` of this provider.
  Discount get discount;
}

class _UpdateDiscountProviderElement
    extends AutoDisposeFutureProviderElement<String?> with UpdateDiscountRef {
  _UpdateDiscountProviderElement(super.provider);

  @override
  Discount get discount => (origin as UpdateDiscountProvider).discount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
