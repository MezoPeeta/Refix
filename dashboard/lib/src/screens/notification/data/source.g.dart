// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsNotifierHash() =>
    r'a4db528fc1fc75f697192e77f2a5b96fdd318f5c';

/// See also [NotificationsNotifier].
@ProviderFor(NotificationsNotifier)
final notificationsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    NotificationsNotifier, List<Notifications>>.internal(
  NotificationsNotifier.new,
  name: r'notificationsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsNotifier = AutoDisposeAsyncNotifier<List<Notifications>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
