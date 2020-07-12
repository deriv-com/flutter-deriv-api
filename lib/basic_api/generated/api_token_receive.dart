/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_receive.json

import '../response.dart';

/// ApiTokenResponse class
class ApiTokenResponse extends Response {
  /// Initialize ApiTokenResponse
  const ApiTokenResponse({
    this.apiToken,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ApiTokenResponse.fromJson(Map<String, dynamic> json) =>
      ApiTokenResponse(
        // ignore: avoid_as
        apiToken: json['api_token'] as Map<String, dynamic>,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Contains the result of API token according to the type of request.
  final Map<String, dynamic> apiToken;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'api_token': apiToken,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ApiTokenResponse copyWith({
    Map<String, dynamic> apiToken,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
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
  List<Object> get props => null;
}
