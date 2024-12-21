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
    ref.read(authProvider).logout();
  }
  return [];
}

@riverpod
Future<List<Service>> getAllServices(Ref ref) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "service", method: "GET");
  final data = jsonDecode(request.body);
  if (request.statusCode == 200) {
    final List<Service> services =
        data.map<Service>((e) => Service.fromJson(e)).toList();
    services.add(const Service(
        name: "Other",
        details: "details",
        id: "",
        price: 0,
        isActive: false,
        childService: [],
        image: "",
        v: 0));
    return services;
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).logout();
    return [];
  }
  return [];
}
