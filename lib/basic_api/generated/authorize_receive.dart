/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/authorize_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// AuthorizeResponse class
class AuthorizeResponse extends Response {
  /// Initialize AuthorizeResponse
  const AuthorizeResponse({
    this.authorize,
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
  factory AuthorizeResponse.fromJson(Map<String, dynamic> json) =>
      AuthorizeResponse(
        authorize: json['authorize'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Account information for the holder of the token.
  final Map<String, dynamic> authorize;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'authorize': authorize,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AuthorizeResponse copyWith({
    Map<String, dynamic> authorize,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AuthorizeResponse(
        authorize: authorize ?? this.authorize,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
