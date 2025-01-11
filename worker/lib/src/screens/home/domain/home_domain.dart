import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api.dart';
import '../../auth/data/auth_data.dart';

part 'home_domain.g.dart';

@riverpod
Future<List<Tasks>> getTasks(Ref ref) async {
  final response = await ref
      .read(httpProvider)
      .authenticatedRequest(method: "GET", url: "worker/tasks");
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data.map<Tasks>((e) => Tasks.fromJson(e)).toList();
  }

  return [];
}
