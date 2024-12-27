import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/auth_data.dart';

part 'users_domain.g.dart';

@riverpod
Future<List<Worker>> getAllWorkers(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "worker?page=$page&take=10&search=$query"
      : "worker?page=$page&take=10";
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (request.statusCode == 200) {
    final data = jsonDecode(request.body)["workers"];
    return data.map<Worker>((e) => Worker.fromJson(e)).toList();
  }
  return [];
}

@riverpod
Future<Worker?> getWorkerByID(Ref ref, {required String id}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "worker/$id", method: "GET");
  if (request.statusCode == 200) {
    final data = jsonDecode(request.body);
    return Worker.fromJson(data);
  }
  return null;
}

@riverpod
Future<String> createWorker(Ref ref,
    {required String username,
    required String email,
    required String password,
    required String phone,
    required String companyName}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "worker", method: "POST", body: {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "company_name": companyName
  });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}

@riverpod
Future<String> updateWorker(Ref ref,
    {required String username,
    required String id,
    required String email,
    required String password,
    required String phone,
    required String companyName}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "worker/$id", method: "PATCH", body: {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "company_name": companyName
  });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}


@riverpod
Future<String> createUser(Ref ref,
    {required String username,
    required String email,
    required String password,
    required String phone,
    }) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "user", method: "POST", body: {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
  });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}

@riverpod
Future<String> updateUser(Ref ref,
    {required String username,
    required String email,
    required String id,
    required String password,
    required String phone,
    }) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "user/$id", method: "PATCH", body: {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
  });
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    return data;
  }
  return data["message"] is List ? data["message"].first : data["message"];
}