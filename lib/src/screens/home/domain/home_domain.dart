import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/domain/auth_domain.dart';
import '../data/home_data.dart';

part 'home_domain.g.dart';

enum AdsType { slider, banner }

@riverpod
Future<List<Ad>> getAds(Ref ref, {AdsType type = AdsType.slider}) async {
  final request = await ref.read(httpProvider).get(
        apiName: "ads?type=${type.name}",
      );
  final data = json.decode(request.body);

  if (request.statusCode == 200) {
    final List<Ad> a = data.map<Ad>((e) => Ad.fromJson(e)).toList();
    return a;
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
  }
  return [];
}

@riverpod
Future<List<Service>> getAllServices(
  Ref ref, {
  String? query,
}) async {
  final url = query != null
      ? "service?page=1&take=10&query=$query"
      : "service?page=1&take=10";

  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    final List<Service> services =
        data.map<Service>((e) => Service.fromJson(e)).toList();
    return services;
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    return [];
  }
  return [];
}

@riverpod
Future<List<Service>> getSubServices(
  Ref ref, {
  String? type,
}) async {
  final url = type != null
      ? "service?page=1&take=10&type=$type"
      : "service?page=1&take=10";

  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    final List<Service> services =
        data.map<Service>((e) => Service.fromJson(e)).toList();

    return services;
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    return [];
  }
  return [];
}
