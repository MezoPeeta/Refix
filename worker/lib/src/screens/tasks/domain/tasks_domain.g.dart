// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateBookingHash() => r'4c4e0bd9183517c3134ffbd9b0758b4b2f152148';

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

/// See also [updateBooking].
@ProviderFor(updateBooking)
const updateBookingProvider = UpdateBookingFamily();

/// See also [updateBooking].
class UpdateBookingFamily extends Family<AsyncValue<String>> {
  /// See also [updateBooking].
  const UpdateBookingFamily();

  /// See also [updateBooking].
  UpdateBookingProvider call({
    required String id,
    String? description,
    required String status,
    List<String>? images,
  }) {
    return UpdateBookingProvider(
      id: id,
      description: description,
      status: status,
      images: images,
    );
  }

  @override
  UpdateBookingProvider getProviderOverride(
    covariant UpdateBookingProvider provider,
  ) {
    return call(
      id: provider.id,
      description: provider.description,
      status: provider.status,
      images: provider.images,
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
  String? get name => r'updateBookingProvider';
}

/// See also [updateBooking].
class UpdateBookingProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateBooking].
  UpdateBookingProvider({
    required String id,
    String? description,
    required String status,
    List<String>? images,
  }) : this._internal(
          (ref) => updateBooking(
            ref as UpdateBookingRef,
            id: id,
            description: description,
            status: status,
            images: images,
          ),
          from: updateBookingProvider,
          name: r'updateBookingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBookingHash,
          dependencies: UpdateBookingFamily._dependencies,
          allTransitiveDependencies:
              UpdateBookingFamily._allTransitiveDependencies,
          id: id,
          description: description,
          status: status,
          images: images,
        );

  UpdateBookingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.description,
    required this.status,
    required this.images,
  }) : super.internal();

  final String id;
  final String? description;
  final String status;
  final List<String>? images;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateBookingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateBookingProvider._internal(
        (ref) => create(ref as UpdateBookingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        description: description,
        status: status,
        images: images,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateBookingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBookingProvider &&
        other.id == id &&
        other.description == description &&
        other.status == status &&
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateBookingRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `description` of this provider.
  String? get description;

  /// The parameter `status` of this provider.
  String get status;

  /// The parameter `images` of this provider.
  List<String>? get images;
}

class _UpdateBookingProviderElement
    extends AutoDisposeFutureProviderElement<String> with UpdateBookingRef {
  _UpdateBookingProviderElement(super.provider);

  @override
  String get id => (origin as UpdateBookingProvider).id;
  @override
  String? get description => (origin as UpdateBookingProvider).description;
  @override
  String get status => (origin as UpdateBookingProvider).status;
  @override
  List<String>? get images => (origin as UpdateBookingProvider).images;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
