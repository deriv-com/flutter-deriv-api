/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_receive.json
// ignore_for_file: avoid_as, always_specify_types

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
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        realityCheck: json['reality_check'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Reality check summary of trades.
  final Map<String, dynamic> realityCheck;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'reality_check': realityCheck,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckResponse copyWith({
    Map<String, dynamic> realityCheck,
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
  List<Object> get props => null;
}
