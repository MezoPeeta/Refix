import 'dart:convert';

import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  Future<Response> delete(
      {required String apiName,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    var url = Uri.https(baseAPI, apiName);
    var response = await http.delete(url, body: body, headers: headers);
    return response;
  }

  Future<Response> put(
      {required String apiName,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    var url = Uri.https(baseAPI, apiName);
    var response = await http.put(url, body: body, headers: headers);
    return response;
  }

  Future<Response> patch(
      {required String apiName,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    var url = Uri.https(baseAPI, apiName);
    var response = await http.patch(url, body: body, headers: headers);
    return response;
  }

  Future<Response> authenticatedRequest({
    required String url,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    final accessToken = await ref.read(authProvider).getAccessToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
      "Content-Type": "application/json",
    };
    var bUrl = Uri.parse("$baseAPI$url");

    switch (method.toUpperCase()) {
      case 'GET':
        return await http.get(bUrl, headers: headers);
      case 'POST':
        return await http.post(bUrl, headers: headers, body: jsonEncode(body));
      case 'PUT':
        return await http.put(bUrl, headers: headers, body: jsonEncode(body));
      case 'PATCH':
        return await http.patch(bUrl, headers: headers, body: jsonEncode(body));
      case 'DELETE':
        return await http.delete(bUrl, headers: headers);
      default:
        throw Exception('Unsupported HTTP method');
    }
  }

  String getResponseError(Response response) {
    final responseBody = jsonDecode(response.body);
    if (responseBody is String) {
      return responseBody;
    }
    final errorMessage = responseBody["message"];
    if (errorMessage is List) {
      return errorMessage.first;
    }
    return errorMessage;
  }
}
