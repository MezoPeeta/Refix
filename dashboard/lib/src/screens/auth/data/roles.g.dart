// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getRoleByIDHash() => r'1655c627723def57cf7a1deab174c6660ddb89e5';

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

/// See also [getRoleByID].
@ProviderFor(getRoleByID)
const getRoleByIDProvider = GetRoleByIDFamily();

/// See also [getRoleByID].
class GetRoleByIDFamily extends Family<AsyncValue<Role?>> {
  /// See also [getRoleByID].
  const GetRoleByIDFamily();

  /// See also [getRoleByID].
  GetRoleByIDProvider call({
    required String id,
  }) {
    return GetRoleByIDProvider(
      id: id,
    );
  }

  @override
  GetRoleByIDProvider getProviderOverride(
    covariant GetRoleByIDProvider provider,
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
  String? get name => r'getRoleByIDProvider';
}

/// See also [getRoleByID].
class GetRoleByIDProvider extends AutoDisposeFutureProvider<Role?> {
  /// See also [getRoleByID].
  GetRoleByIDProvider({
    required String id,
  }) : this._internal(
          (ref) => getRoleByID(
            ref as GetRoleByIDRef,
            id: id,
          ),
          from: getRoleByIDProvider,
          name: r'getRoleByIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRoleByIDHash,
          dependencies: GetRoleByIDFamily._dependencies,
          allTransitiveDependencies:
              GetRoleByIDFamily._allTransitiveDependencies,
          id: id,
        );

  GetRoleByIDProvider._internal(
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
    FutureOr<Role?> Function(GetRoleByIDRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRoleByIDProvider._internal(
        (ref) => create(ref as GetRoleByIDRef),
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
  AutoDisposeFutureProviderElement<Role?> createElement() {
    return _GetRoleByIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRoleByIDProvider && other.id == id;
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
mixin GetRoleByIDRef on AutoDisposeFutureProviderRef<Role?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetRoleByIDProviderElement
    extends AutoDisposeFutureProviderElement<Role?> with GetRoleByIDRef {
  _GetRoleByIDProviderElement(super.provider);

  @override
  String get id => (origin as GetRoleByIDProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
