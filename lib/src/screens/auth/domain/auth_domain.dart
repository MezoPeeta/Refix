import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:refix/src/core/network/api.dart';
import 'package:refix/src/screens/auth/data/auth_data.dart';

final authProvider = Provider<AuthDomain>(AuthDomain.new);

class AuthDomain {
  final Ref ref;
  AuthDomain(this.ref);

  Future<Either<String, UserAccount>> signin({
    required String email,
    required String password,
  }) async {
    final response =
        await ref.read(httpProvider).post(apiName: "signin", body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 201) {
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return right(UserAccount.fromJson(decodedResponse));
    }

    return left(response.body);
  }

  Future<Either<String, UserAccount>> signup({
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
      return right(UserAccount.fromJson(decodedResponse));
    }

    return left(response.body);
  }
}
