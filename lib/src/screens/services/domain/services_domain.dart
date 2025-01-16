import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';

part 'services_domain.g.dart';

@riverpod
Future<double> getAvgReviews(Ref ref, {required String type}) async {
  try {
    final response = await ref.read(httpProvider).authenticatedRequest(
          method: "GET",
          url: "review/service/avg?serviceType=$type",
        );
    return jsonDecode(response.body)["average"] as double;
  } catch (e) {}
  return 0.0;
}
