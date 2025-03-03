// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendFCMTokenHash() => r'b0af4a2245b9340b9297da2091c29ce010c273b7';

/// See also [sendFCMToken].
@ProviderFor(sendFCMToken)
final sendFCMTokenProvider = AutoDisposeFutureProvider<void>.internal(
  sendFCMToken,
  name: r'sendFCMTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sendFCMTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SendFCMTokenRef = AutoDisposeFutureProviderRef<void>;
String _$markNotificationReadHash() =>
    r'6b22b65aacfec3a84eb12bb96316e4f47f6bcf0c';

/// See also [markNotificationRead].
@ProviderFor(markNotificationRead)
final markNotificationReadProvider =
    AutoDisposeFutureProvider<Object?>.internal(
  markNotificationRead,
  name: r'markNotificationReadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$markNotificationReadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MarkNotificationReadRef = AutoDisposeFutureProviderRef<Object?>;
String _$notificationsHash() => r'a22c335b4a9ed286349bd632a5cee260220842b5';

/// See also [Notifications].
@ProviderFor(Notifications)
final notificationsProvider = AutoDisposeAsyncNotifierProvider<Notifications,
    List<Notification>>.internal(
  Notifications.new,
  name: r'notificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Notifications = AutoDisposeAsyncNotifier<List<Notification>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
