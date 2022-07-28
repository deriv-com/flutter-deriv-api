import 'dart:convert' as convert;

import 'package:flutter_deriv_api/services/connection/http_client/exceptions/http_client_exception.dart';
import 'package:http/http.dart' as http;

/// Singleton class for http requests.
class HttpClient {
  /// Initializes http client.
  factory HttpClient() => _instance;

  HttpClient._internal();

  static final HttpClient _instance = HttpClient._internal();

  /// Http get request.
  Future<http.Response> get(String url) async => http.get(Uri.parse(url));

  ///  Http post request.
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> jsonBody,
    Map<String, String>? headers,
  }) async {
    final String jsonString = convert.jsonEncode(jsonBody);

    final http.Response response =
        await http.post(Uri.parse(url), body: jsonString, headers: headers);

    final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    if (response.statusCode ~/ 100 != 2) {
      throw HTTPClientException(
        errorCode: jsonResponse['error_code'],
        statusCode: response.statusCode,
        message: jsonResponse.containsKey('message')
            ? jsonResponse['message']
            : 'Server Error',
      );
    }

    return jsonResponse;
  }
}