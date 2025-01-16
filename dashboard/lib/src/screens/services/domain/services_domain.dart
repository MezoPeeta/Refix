import 'dart:convert';

import 'package:dashboard/src/core/navigation/routes.dart';
import 'package:dashboard/src/screens/booking/data/booking.dart';
import 'package:dashboard/src/screens/users/domain/source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/navigation/api.dart';
import '../../content/domain/onetime_domain.dart';

part 'services_domain.g.dart';

@riverpod
Future<List<Service>> getServices(Ref ref,
    {required int page, String? query}) async {
  final url = query != null
      ? "service?page=$page&take=10&search=$query"
      : "service?page=$page&take=10";
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: url, method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    return decoded.map<Service>((e) => Service.fromJson(e)).toList();
  }

  return [];
}

@riverpod
Future<List<dynamic>> getServicesTypes(
  Ref ref,
) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "service/types", method: "GET");
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    return decoded;
  }

  return [];
}

@riverpod
Future<String> createService(Ref ref,
    {required Service service, required Uint8List image}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "service", method: "POST", body: {
    "name": service.name?.toJson(),
    "price": service.price,
    "details": service.details!.toJson(),
    "is_active": service.isActive,
    "type": service.type,
    "image": base64Encode(await compressImage(image))
  });
  if (response.statusCode == 201) {
    ref.invalidate(getServicesProvider);
    ref.read(goRouterProvider).pop();

    return "Service created successfully";
  }
  return "Error in creating service";
}

@riverpod
Future<String> updateService(Ref ref,
    {required Service service, Uint8List? image}) async {
  Map<String, dynamic> serviceMap = {
    "name": service.name!.toJson(),
    "price": service.price,
    "details": service.details!.toJson(),
    "is_active": service.isActive,
    "type": service.type,
  };

  if (image != null) {
    serviceMap["image"] = base64Encode(await compressImage(image));
  }
  final response = await ref.read(httpProvider).authenticatedRequest(
      url: "service/${service.id}", method: "PUT", body: serviceMap);
  if (response.statusCode == 200) {
    ref.invalidate(getServicesProvider);
    ref.read(goRouterProvider).pop();
    return "Service updated successfully";
  }
  return "Error in creating service";
}

@riverpod
Future<String> deleteService(Ref ref, {required String id}) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(url: "service/$id", method: "DELETE");
  ref.invalidate(getServicesProvider);
  ref.read(goRouterProvider).pop();

  return getResponseMessage(jsonDecode(response.body));
}
