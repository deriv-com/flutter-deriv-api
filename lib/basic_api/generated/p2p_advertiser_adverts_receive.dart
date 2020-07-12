/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_receive.json

import '../response.dart';

/// P2pAdvertiserAdvertsResponse class
class P2pAdvertiserAdvertsResponse extends Response {
  /// Initialize P2pAdvertiserAdvertsResponse
  const P2pAdvertiserAdvertsResponse({
    this.p2pAdvertiserAdverts,
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
  factory P2pAdvertiserAdvertsResponse.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdvertsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pAdvertiserAdverts:
            json['p2p_advertiser_adverts'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// List of the P2P advertiser adverts.
  final Map<String, dynamic> p2pAdvertiserAdverts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_advertiser_adverts': p2pAdvertiserAdverts,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsResponse copyWith({
    Map<String, dynamic> p2pAdvertiserAdverts,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
