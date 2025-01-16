import 'dart:convert';

import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:retry/retry.dart';

final httpProvider = Provider<HttpAPI>(HttpAPI.new);

class HttpAPI {
  final String baseAPI = "https://api.refixapp.com/api/v1/";

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
    const r = RetryOptions(maxAttempts: 2);
    final accessToken = await ref.read(authProvider).getAccessToken();

    Future<Response> makeRequest() async {
      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        "Content-Type": "application/json",
      };
      var bUrl = Uri.parse("$baseAPI$url");

      Response response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(bUrl, headers: headers);
          break;
        case 'POST':
          response =
              await http.post(bUrl, headers: headers, body: jsonEncode(body));
          break;
        case 'PUT':
          response =
              await http.put(bUrl, headers: headers, body: jsonEncode(body));
          break;
        case 'PATCH':
          response = await http.patch(bUrl,
              headers: headers, body: body != null ? jsonEncode(body) : null);
          break;
        case 'DELETE':
          response = await http.delete(bUrl, headers: headers);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      if (response.statusCode == 401) {
        await ref.read(authProvider).refreshAccessToken();
      }
      return response;
    }

    return await r.retry(
      makeRequest,
      retryIf: (e) => e is UnauthorizedException,
    );
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

class UnauthorizedException implements Exception {}
