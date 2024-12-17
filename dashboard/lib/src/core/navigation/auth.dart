import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../screens/auth/data/auth_data.dart';
import '../storage/storage.dart';
import 'api.dart';

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
    }
  }

  Future<Either<String, UserAccount>> signin({
    required String email,
    required String password,
  }) async {
    final response =
        await ref.read(httpProvider).post(apiName: "dashboard/signin", body: {
      "email": email,
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

    return left(response.body);
  }

  Future<Either<ErrorResponse, UserAccount>> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    final response =
        await ref.read(httpProvider).post(apiName: "signup", body: {
      "username": username,
      "email": email,
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

    return left(ErrorResponse.fromJson(jsonDecode(response.body)));
  }
}
