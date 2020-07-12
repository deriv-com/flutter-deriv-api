/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Topup virtual response class
class TopupVirtualResponse extends Response {
  /// Initialize TopupVirtualResponse
  const TopupVirtualResponse({
    this.topupVirtual,
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
  factory TopupVirtualResponse.fromJson(Map<String, dynamic> json) =>
      TopupVirtualResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        topupVirtual: json['topup_virtual'] as Map<String, dynamic>,
      );

  /// The information regarding a successful top up for a virtual money account
  final Map<String, dynamic> topupVirtual;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'topup_virtual': topupVirtual,
      };

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualResponse copyWith({
    Map<String, dynamic> topupVirtual,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TopupVirtualResponse(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
