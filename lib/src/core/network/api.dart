import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../screens/auth/domain/auth_domain.dart';

final httpProvider = Provider<HttpAPI>(HttpAPI.new);

class HttpAPI {
  final String baseAPI = "https://refix-api.onrender.com/api/v1/";
  Ref ref;
  HttpAPI(this.ref);
  Future<Response> post(
      {required String apiName,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    var url = Uri.parse("$baseAPI$apiName");
    var response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<Response> get(
      {required String apiName, Map<String, String>? headers}) async {
    var url = Uri.parse("$baseAPI$apiName");
    var response = await http.get(url, headers: headers);
    return response;
  }

  Future<Response> authenticatedRequest({
    required String url,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    String? accessToken = await ref.read(authProvider).getAccessToken();

    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
    var bUrl = Uri.parse("$baseAPI$url");

    switch (method.toUpperCase()) {
      case 'GET':
        return await http.get(bUrl, headers: headers);
      case 'POST':
        return await http.post(bUrl, headers: headers, body: json.encode(body));
      case 'PUT':
        return await http.put(bUrl, headers: headers, body: json.encode(body));
      case 'DELETE':
        return await http.delete(bUrl, headers: headers);
      default:
        throw Exception('Unsupported HTTP method');
    }
  }
}
