/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Api token receive class.
class ApiTokenReceive extends Response {
  /// Initialize ApiTokenReceive.
  const ApiTokenReceive({
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

  /// Creates an instance from JSON.
  factory ApiTokenReceive.fromJson(Map<String, dynamic> json) =>
      ApiTokenReceive(
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
  ApiTokenReceive copyWith({
    Map<String, dynamic>? apiToken,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ApiTokenReceive(
        apiToken: apiToken ?? this.apiToken,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
