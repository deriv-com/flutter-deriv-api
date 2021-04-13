/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Reality check response class
class RealityCheckResponse extends Response {
  /// Initialize RealityCheckResponse
  const RealityCheckResponse({
    this.realityCheck,
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
  factory RealityCheckResponse.fromJson(Map<String, dynamic> json) =>
      RealityCheckResponse(
        realityCheck: json['reality_check'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Reality check summary of trades.
  final Map<String, dynamic>? realityCheck;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'reality_check': realityCheck,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckResponse copyWith({
    Map<String, dynamic>? realityCheck,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      RealityCheckResponse(
        realityCheck: realityCheck ?? this.realityCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
