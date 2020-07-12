/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_info_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2pAdvertiserInfoResponse class
class P2pAdvertiserInfoResponse extends Response {
  /// Initialize P2pAdvertiserInfoResponse
  const P2pAdvertiserInfoResponse({
    this.p2pAdvertiserInfo,
    this.subscription,
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
  factory P2pAdvertiserInfoResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfoResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        p2pAdvertiserInfo: json['p2p_advertiser_info'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserInfo;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advertiser_info': p2pAdvertiserInfo,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserInfoResponse copyWith({
    Map<String, dynamic> p2pAdvertiserInfo,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
