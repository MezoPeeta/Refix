import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:refix/src/core/localization/domain.dart';
import 'package:retry/retry.dart';

import '../../screens/auth/domain/auth_domain.dart';

final httpProvider = Provider<HttpAPI>(HttpAPI.new);

class HttpAPI {
  final String baseAPI = "https://api.refixapp.com/api/v1/";
  Ref ref;
  HttpAPI(this.ref);
  Future<Response> post({
    required String apiName,
    Object? body,
  }) async {
    var url = Uri.parse("$baseAPI$apiName");
    final currentLocale = ref.read(localeNotifierProvider).languageCode;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept-Language": currentLocale,
    };
    var response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    return response;
  }

  Future<Response> get({required String apiName}) async {
    var url = Uri.parse("$baseAPI$apiName");
    final currentLocale = ref.read(localeNotifierProvider).languageCode;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept-Language": currentLocale,
    };
    var response = await http.get(url, headers: headers);
    return response;
  }

  Future<Response> authenticatedRequest({
    required String url,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    const r = RetryOptions(
        maxAttempts: 3,
        maxDelay: Duration(minutes: 1),
        delayFactor: Duration(seconds: 50));
    String? accessToken = await ref.read(authProvider).getAccessToken();
    final currentLocale = ref.read(localeNotifierProvider).languageCode;

    Future<Response> makeRequest() async {
      Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
        "Content-Type": "application/json",
        "Accept-Language": currentLocale,
      };
      var bUrl = Uri.parse("$baseAPI$url");

      Response response;
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(bUrl, headers: headers);

          break;
        case 'POST':
          response = await http.post(bUrl,
              headers: headers, body: body != null ? jsonEncode(body) : null);
          break;
        case 'PUT':
          response = await http.put(bUrl,
              headers: headers, body: body != null ? jsonEncode(body) : null);
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
        accessToken = await ref.read(authProvider).refreshAccessToken();
        throw UnauthorizedException();
      }

      return response;
    }

    return await r.retry(
      makeRequest,
      onRetry: (e) {
        log("Retrying Request: $e");
      },
      retryIf: (e) => e is UnauthorizedException,
    );
  }

  Future<MultipartRequest> sendMultipart(
      {required String url,
      required List<String> filePaths,
      required String fieldName}) async {
    var bUrl = Uri.parse("$baseAPI$url");
    var request = http.MultipartRequest('POST', bUrl);
    for (final image in filePaths) {
      request.files.add(await http.MultipartFile.fromPath(
        fieldName,
        image,
        contentType: MediaType('image', 'webp'),
      ));
    }

    final accessToken = await ref.read(authProvider).getAccessToken();

    // Add headers
    request.headers['Authorization'] = 'Bearer $accessToken';
    return request;
  }
}

class UnauthorizedException implements Exception {}
