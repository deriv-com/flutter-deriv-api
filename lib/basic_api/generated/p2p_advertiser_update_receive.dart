/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_update_receive.json

import '../response.dart';

/// P2pAdvertiserUpdateResponse class
class P2pAdvertiserUpdateResponse extends Response {
  /// Initialize P2pAdvertiserUpdateResponse
  const P2pAdvertiserUpdateResponse({
    this.p2pAdvertiserUpdate,
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
  factory P2pAdvertiserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdateResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pAdvertiserUpdate:
            json['p2p_advertiser_update'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// P2P advertiser information.
  final Map<String, dynamic> p2pAdvertiserUpdate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advertiser_update': p2pAdvertiserUpdate,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserUpdateResponse copyWith({
    Map<String, dynamic> p2pAdvertiserUpdate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
