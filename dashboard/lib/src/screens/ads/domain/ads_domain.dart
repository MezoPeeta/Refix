import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/screens/ads/data/ads.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_domain.g.dart';

enum AdsType { slider, banner }

@riverpod
Future<Either<String, String>> addAds(Ref ref,
    {required Uint8List image, required AdsType type}) async {
  final request = await ref.read(httpProvider).uploadFile(
      api: "ads", method: "POST", bytesFile: image, body: {"type": type.name});

  try {
    final response = await request.send();
    final body = await response.stream.bytesToString();
    if (response.statusCode == 201) {
      return right("Ad created successfully");
    }
    if (response.statusCode == 401) {
      ref.read(authProvider).logout();
    } else {
      return left("Ad creation failed: ${jsonDecode(body)["message"].first} ");
    }
  } catch (e) {
    return left("Ad creation failed: $e");
  }
  return left("Ad creation failed");
}

@riverpod
Future<List<Ad>> getAds(Ref ref, {AdsType? type}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "ads",
      method: "GET",
      body: type != null ? {"type": type.name} : null);
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
Future<Either<String, Ad>> getAdsById(Ref ref, {required String id}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "ads/$id", method: "GET");
  final data = json.decode(request.body);

  if (request.statusCode == 200) {
    return right(Ad.fromJson(data));
  }
  return left(data["message"].first);
}

@riverpod
Future<String> updateAdsById(Ref ref,
    {required String id,
    required String type,
    required Uint8List image}) async {
  final request = await ref.read(httpProvider).uploadFile(
      api: "ads/$id", method: "PATCH", bytesFile: image, body: {"type": type});

  final response = await request.send();

  final data = await response.stream.bytesToString();
  debugPrint("AD: $data");

  return jsonDecode(data)["message"].first;
}
