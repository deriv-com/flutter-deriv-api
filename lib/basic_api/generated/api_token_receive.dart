/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Api token response class
class ApiTokenResponse extends Response {
  /// Initialize ApiTokenResponse
  const ApiTokenResponse({
    this.apiToken,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ApiTokenResponse.fromJson(Map<String, dynamic> json) =>
      ApiTokenResponse(
        apiToken: json['api_token'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Contains the result of API token according to the type of request.
  final Map<String, dynamic>? apiToken;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'api_token': apiToken,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ApiTokenResponse copyWith({
    Map<String, dynamic>? apiToken,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ApiTokenResponse(
        apiToken: apiToken ?? this.apiToken,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
