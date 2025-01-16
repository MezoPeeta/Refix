import 'dart:convert';

import 'package:dashboard/src/core/navigation/api.dart';
import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:dashboard/src/screens/ads/data/ads.dart';
import 'package:dashboard/src/screens/content/domain/onetime_domain.dart';
import 'package:dashboard/src/screens/navbar/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_domain.g.dart';

enum AdsType { slider, banner }

@riverpod
Future<String> addAds(Ref ref,
    {required Uint8List image, required String type}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "ads",
      method: "POST",
      body: {"type": type, "image": base64Encode(await compressImage(image))});
  print(request.statusCode);

  if (request.statusCode == 201) {
    ref.watch(currentIndexProvider.notifier).state = 7;
    ref.invalidate(getAdsProvider);

    return "Ad created successfully";
  }

  return Future.error("Ad Creation Failed");
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
    ref.read(authProvider).refreshAccessToken();
    getAds(ref);
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
Future<String?> updateAdsById(Ref ref,
    {required String id,
    required String type,
    required Uint8List image}) async {
  final request = await ref.read(httpProvider).authenticatedRequest(
      url: "ads/$id",
      method: "PATCH",
      body: {"type": type, "image": base64Encode(image)});

  if (request.statusCode == 200) {
    return request.body;
  }
  if (request.statusCode == 401) {
    ref.read(authProvider).refreshAccessToken();
    updateAdsById(ref, id: id, type: type, image: image);
    return null;
  }
  if (request.statusCode == 413) {
    return Future.error("Entity is too large");
  }
  final errorMessage = jsonDecode(request.body)["message"];
  if (errorMessage is List) {
    return Future.error(errorMessage.first);
  }
  return Future.error(errorMessage);
}

@riverpod
Future<void> deleteAd(Ref ref, {required String id}) async {
  final request = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "ads/$id", method: "DELETE");
  final data = json.decode(request.body);

  ref.watch(currentIndexProvider.notifier).state = 7;
  ref.invalidate(getAdsProvider);
}
