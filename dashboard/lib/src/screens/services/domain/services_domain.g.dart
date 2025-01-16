// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getServicesHash() => r'75ed3701fb5c094d630cd3ab6a5904e446260925';

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

/// See also [getServices].
@ProviderFor(getServices)
const getServicesProvider = GetServicesFamily();

/// See also [getServices].
class GetServicesFamily extends Family<AsyncValue<List<Service>>> {
  /// See also [getServices].
  const GetServicesFamily();

  /// See also [getServices].
  GetServicesProvider call({
    required int page,
    String? query,
  }) {
    return GetServicesProvider(
      page: page,
      query: query,
    );
  }

  @override
  GetServicesProvider getProviderOverride(
    covariant GetServicesProvider provider,
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
  String? get name => r'getServicesProvider';
}

/// See also [getServices].
class GetServicesProvider extends AutoDisposeFutureProvider<List<Service>> {
  /// See also [getServices].
  GetServicesProvider({
    required int page,
    String? query,
  }) : this._internal(
          (ref) => getServices(
            ref as GetServicesRef,
            page: page,
            query: query,
          ),
          from: getServicesProvider,
          name: r'getServicesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getServicesHash,
          dependencies: GetServicesFamily._dependencies,
          allTransitiveDependencies:
              GetServicesFamily._allTransitiveDependencies,
          page: page,
          query: query,
        );

  GetServicesProvider._internal(
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
    FutureOr<List<Service>> Function(GetServicesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetServicesProvider._internal(
        (ref) => create(ref as GetServicesRef),
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
  AutoDisposeFutureProviderElement<List<Service>> createElement() {
    return _GetServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetServicesProvider &&
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
mixin GetServicesRef on AutoDisposeFutureProviderRef<List<Service>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `query` of this provider.
  String? get query;
}

class _GetServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<Service>>
    with GetServicesRef {
  _GetServicesProviderElement(super.provider);

  @override
  int get page => (origin as GetServicesProvider).page;
  @override
  String? get query => (origin as GetServicesProvider).query;
}

String _$getServicesTypesHash() => r'c6dadb64d28fb93e30d867fed9f7d060ff5cd993';

/// See also [getServicesTypes].
@ProviderFor(getServicesTypes)
final getServicesTypesProvider =
    AutoDisposeFutureProvider<List<dynamic>>.internal(
  getServicesTypes,
  name: r'getServicesTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getServicesTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetServicesTypesRef = AutoDisposeFutureProviderRef<List<dynamic>>;
String _$createServiceHash() => r'f1ce01b3aae546ba1ed25b94a282b4a62ba58cff';

/// See also [createService].
@ProviderFor(createService)
const createServiceProvider = CreateServiceFamily();

/// See also [createService].
class CreateServiceFamily extends Family<AsyncValue<String>> {
  /// See also [createService].
  const CreateServiceFamily();

  /// See also [createService].
  CreateServiceProvider call({
    required Service service,
    required Uint8List image,
  }) {
    return CreateServiceProvider(
      service: service,
      image: image,
    );
  }

  @override
  CreateServiceProvider getProviderOverride(
    covariant CreateServiceProvider provider,
  ) {
    return call(
      service: provider.service,
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
  String? get name => r'createServiceProvider';
}

/// See also [createService].
class CreateServiceProvider extends AutoDisposeFutureProvider<String> {
  /// See also [createService].
  CreateServiceProvider({
    required Service service,
    required Uint8List image,
  }) : this._internal(
          (ref) => createService(
            ref as CreateServiceRef,
            service: service,
            image: image,
          ),
          from: createServiceProvider,
          name: r'createServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createServiceHash,
          dependencies: CreateServiceFamily._dependencies,
          allTransitiveDependencies:
              CreateServiceFamily._allTransitiveDependencies,
          service: service,
          image: image,
        );

  CreateServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.service,
    required this.image,
  }) : super.internal();

  final Service service;
  final Uint8List image;

  @override
  Override overrideWith(
    FutureOr<String> Function(CreateServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateServiceProvider._internal(
        (ref) => create(ref as CreateServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        service: service,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _CreateServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateServiceProvider &&
        other.service == service &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, service.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateServiceRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `service` of this provider.
  Service get service;

  /// The parameter `image` of this provider.
  Uint8List get image;
}

class _CreateServiceProviderElement
    extends AutoDisposeFutureProviderElement<String> with CreateServiceRef {
  _CreateServiceProviderElement(super.provider);

  @override
  Service get service => (origin as CreateServiceProvider).service;
  @override
  Uint8List get image => (origin as CreateServiceProvider).image;
}

String _$updateServiceHash() => r'3055cd3e969f0f72b89a9f52eb88db96996ec8fb';

/// See also [updateService].
@ProviderFor(updateService)
const updateServiceProvider = UpdateServiceFamily();

/// See also [updateService].
class UpdateServiceFamily extends Family<AsyncValue<String>> {
  /// See also [updateService].
  const UpdateServiceFamily();

  /// See also [updateService].
  UpdateServiceProvider call({
    required Service service,
    Uint8List? image,
  }) {
    return UpdateServiceProvider(
      service: service,
      image: image,
    );
  }

  @override
  UpdateServiceProvider getProviderOverride(
    covariant UpdateServiceProvider provider,
  ) {
    return call(
      service: provider.service,
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
  String? get name => r'updateServiceProvider';
}

/// See also [updateService].
class UpdateServiceProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateService].
  UpdateServiceProvider({
    required Service service,
    Uint8List? image,
  }) : this._internal(
          (ref) => updateService(
            ref as UpdateServiceRef,
            service: service,
            image: image,
          ),
          from: updateServiceProvider,
          name: r'updateServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateServiceHash,
          dependencies: UpdateServiceFamily._dependencies,
          allTransitiveDependencies:
              UpdateServiceFamily._allTransitiveDependencies,
          service: service,
          image: image,
        );

  UpdateServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.service,
    required this.image,
  }) : super.internal();

  final Service service;
  final Uint8List? image;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateServiceProvider._internal(
        (ref) => create(ref as UpdateServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        service: service,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateServiceProvider &&
        other.service == service &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, service.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateServiceRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `service` of this provider.
  Service get service;

  /// The parameter `image` of this provider.
  Uint8List? get image;
}

class _UpdateServiceProviderElement
    extends AutoDisposeFutureProviderElement<String> with UpdateServiceRef {
  _UpdateServiceProviderElement(super.provider);

  @override
  Service get service => (origin as UpdateServiceProvider).service;
  @override
  Uint8List? get image => (origin as UpdateServiceProvider).image;
}

String _$deleteServiceHash() => r'0baa0d3e1bf52dd47e9fefe5be571ba7237aeb98';

/// See also [deleteService].
@ProviderFor(deleteService)
const deleteServiceProvider = DeleteServiceFamily();

/// See also [deleteService].
class DeleteServiceFamily extends Family<AsyncValue<String>> {
  /// See also [deleteService].
  const DeleteServiceFamily();

  /// See also [deleteService].
  DeleteServiceProvider call({
    required String id,
  }) {
    return DeleteServiceProvider(
      id: id,
    );
  }

  @override
  DeleteServiceProvider getProviderOverride(
    covariant DeleteServiceProvider provider,
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
  String? get name => r'deleteServiceProvider';
}

/// See also [deleteService].
class DeleteServiceProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deleteService].
  DeleteServiceProvider({
    required String id,
  }) : this._internal(
          (ref) => deleteService(
            ref as DeleteServiceRef,
            id: id,
          ),
          from: deleteServiceProvider,
          name: r'deleteServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteServiceHash,
          dependencies: DeleteServiceFamily._dependencies,
          allTransitiveDependencies:
              DeleteServiceFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteServiceProvider._internal(
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
    FutureOr<String> Function(DeleteServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteServiceProvider._internal(
        (ref) => create(ref as DeleteServiceRef),
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
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DeleteServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteServiceProvider && other.id == id;
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
mixin DeleteServiceRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteServiceProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeleteServiceRef {
  _DeleteServiceProviderElement(super.provider);

  @override
  String get id => (origin as DeleteServiceProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
