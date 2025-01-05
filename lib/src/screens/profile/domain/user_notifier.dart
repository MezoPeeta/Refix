import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:refix/src/screens/auth/data/auth_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';

part 'user_notifier.g.dart';

@riverpod
class CustomerNotifier extends _$CustomerNotifier {
  Future<User?> _fetchUser() async {
    final response = await ref
        .read(httpProvider)
        .authenticatedRequest(method: "GET", url: "me");
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    return null;
  }

  @override
  FutureOr<User?> build() async => _fetchUser();

  Future<void> updateCustomer(User user) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(httpProvider).authenticatedRequest(
          method: "PATCH",
          url: "customer/${user.id}",
          body: user.toJson());
      log("Updated Customer: ${response.body}");
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
      return null;
    });
  }
}
