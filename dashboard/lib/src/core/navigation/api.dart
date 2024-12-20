import 'dart:convert';

import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart' as mime;

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

  Future<MultipartRequest> uploadFile(
      {required String api,
      required String method,
      String fileField = "image",
      String filename = "image.png",
      Map<String, dynamic>? body,
      required Uint8List bytesFile}) async {
    final token = await ref.read(authProvider).getAccessToken();
    var request = http.MultipartRequest(method, Uri.parse("$baseAPI$api"));
    request.files.add(http.MultipartFile.fromBytes("image", bytesFile,
        filename: filename, contentType: mime.MediaType('image', 'png')));
    request.headers['Authorization'] = 'Bearer $token';
    if (body != null) {
      body.forEach((key, value) {
        request.fields[key] = value;
      });
    }

    return request;
  }
}
