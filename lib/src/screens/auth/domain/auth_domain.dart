import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:refix/src/core/network/api.dart';
import 'package:refix/src/core/storage/secure_storage.dart';
import 'package:refix/src/screens/auth/data/auth_data.dart';
import 'package:refix/src/screens/services/domain/booking_domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/routes.dart';

part 'auth_domain.g.dart';

final authProvider = Provider<AuthDomain>(AuthDomain.new);

class AuthDomain {
  final Ref ref;
  AuthDomain(this.ref);
  final storage = SecureStorage();

  Future<void> saveTokens(
      {required String accessToken, required String refreshToken}) async {
    await storage.write(key: "access_token", value: accessToken);
    await storage.write(key: "refresh_token", value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: "access_token");
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: "refresh_token");
  }

  Future<String?> refreshAccessToken() async {
    try {
      String? refreshToken = await getRefreshToken();

      if (refreshToken == null) {
        return null;
      }

      final response = await ref
          .read(httpProvider)
          .post(apiName: "refresh-token", body: {'refreshToken': refreshToken});
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        await saveTokens(
            accessToken: data['accessToken'],
            refreshToken: data['refreshToken'] ??
                refreshToken // Use new refresh token if provided
            );
        return data["accessToken"];
      }
      if (response.statusCode == 401) {
        await logout();
        return null;
      }
    } catch (e) {
      debugPrint("Token Refresh Error: $e");
    }
    return null;
  }

  Future<bool> revokeRefreshToken() async {
    try {
      String? refreshToken = await getRefreshToken();

      if (refreshToken == null) {
        return false;
      }

      final response = await ref.read(httpProvider).post(
        apiName: "revoke-refresh-token",
        body: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        await logout();
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Revoke token error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await revokeRefreshToken();
    } catch (e) {
      print('Error during logout: $e');
    } finally {
      await storage.delete(key: 'access_token');
      await storage.delete(key: 'refresh_token');
      ref.read(goRouterProvider).go("/login");
    }
  }

  Future<Either<String, UserAccount>> signin({
    required String email,
    required String password,
  }) async {
    final response =
        await ref.read(httpProvider).post(apiName: "signin", body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      final account = UserAccount.fromJson(decodedResponse);
      await saveTokens(
          accessToken: account.accessToken, refreshToken: account.refreshToken);
      return right(account);
    }
    final errorMessage = jsonDecode(response.body)["message"];
    if (errorMessage is List) {
      return left(errorMessage.first);
    }

    return left(errorMessage);
  }

  Future<Either<String, UserAccount>> signup({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    final response =
        await ref.read(httpProvider).post(apiName: "signup", body: {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    if (response.statusCode == 201) {
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final account = UserAccount.fromJson(decodedResponse);
      await saveTokens(
          accessToken: account.accessToken, refreshToken: account.refreshToken);
      return right(account);
    }
    if (response.statusCode == 401) {
      ref.read(authProvider).logout();
    }

    final errorMessage = jsonDecode(response.body)["message"];
    if (errorMessage is List) {
      return left(errorMessage.first);
    }

    return left(errorMessage);
  }
}

@riverpod
Future<User?> getCurrentUser(Ref ref) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "GET", url: "me");
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  }
  if (response.statusCode == 401) {
    ref.read(authProvider).logout();
  }
  return null;
}

@riverpod
Future<String?> updateCurrentUser(Ref ref, {required User user}) async {
  final currentUser = await ref.read(getCurrentUserProvider.future);
  final response = await ref.read(httpProvider).authenticatedRequest(
      method: "PATCH", url: "customer/${currentUser?.id}", body: user.toJson());
  log("Updated Customer: ${response.body}");
  if (response.statusCode == 200) {
    return "Updated Successfully";
  }

  return null;
}

@riverpod
Future<void> deleteCurrentUser(
  Ref ref,
) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "DELETE", url: "customer");
  log("Response: ${response.body}");
  if (response.statusCode == 200) {
    await SecureStorage().delete(key: 'access_token');
    await SecureStorage().delete(key: 'refresh_token');
    return ref.read(goRouterProvider).go("/login");
  }

  return;
}
