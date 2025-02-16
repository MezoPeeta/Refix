// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateBookingHash() => r'c200e3175270f3ec0dfaf46769a31ed86a1f53dd';

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
    List<XFile>? images,
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
    List<XFile>? images,
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
  final List<XFile>? images;

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
  List<XFile>? get images;
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
  List<XFile>? get images => (origin as UpdateBookingProvider).images;
}

String _$taskRequestedHash() => r'ae28d93c7424b49d65a07b7f8f711dca7f023605';

abstract class _$TaskRequested extends BuildlessAutoDisposeNotifier<bool> {
  late final String taskID;

  bool build({
    required String taskID,
  });
}

/// See also [TaskRequested].
@ProviderFor(TaskRequested)
const taskRequestedProvider = TaskRequestedFamily();

/// See also [TaskRequested].
class TaskRequestedFamily extends Family<bool> {
  /// See also [TaskRequested].
  const TaskRequestedFamily();

  /// See also [TaskRequested].
  TaskRequestedProvider call({
    required String taskID,
  }) {
    return TaskRequestedProvider(
      taskID: taskID,
    );
  }

  @override
  TaskRequestedProvider getProviderOverride(
    covariant TaskRequestedProvider provider,
  ) {
    return call(
      taskID: provider.taskID,
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
  String? get name => r'taskRequestedProvider';
}

/// See also [TaskRequested].
class TaskRequestedProvider
    extends AutoDisposeNotifierProviderImpl<TaskRequested, bool> {
  /// See also [TaskRequested].
  TaskRequestedProvider({
    required String taskID,
  }) : this._internal(
          () => TaskRequested()..taskID = taskID,
          from: taskRequestedProvider,
          name: r'taskRequestedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskRequestedHash,
          dependencies: TaskRequestedFamily._dependencies,
          allTransitiveDependencies:
              TaskRequestedFamily._allTransitiveDependencies,
          taskID: taskID,
        );

  TaskRequestedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskID,
  }) : super.internal();

  final String taskID;

  @override
  bool runNotifierBuild(
    covariant TaskRequested notifier,
  ) {
    return notifier.build(
      taskID: taskID,
    );
  }

  @override
  Override overrideWith(TaskRequested Function() create) {
    return ProviderOverride(
      origin: this,
      override: TaskRequestedProvider._internal(
        () => create()..taskID = taskID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskID: taskID,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TaskRequested, bool> createElement() {
    return _TaskRequestedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskRequestedProvider && other.taskID == taskID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskRequestedRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `taskID` of this provider.
  String get taskID;
}

class _TaskRequestedProviderElement
    extends AutoDisposeNotifierProviderElement<TaskRequested, bool>
    with TaskRequestedRef {
  _TaskRequestedProviderElement(super.provider);

  @override
  String get taskID => (origin as TaskRequestedProvider).taskID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
