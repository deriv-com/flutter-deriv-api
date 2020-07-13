/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2p advertiser adverts response class
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
        p2pAdvertiserAdverts:
            json['p2p_advertiser_adverts'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// List of the P2P advertiser adverts.
  final Map<String, dynamic> p2pAdvertiserAdverts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_adverts': p2pAdvertiserAdverts,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
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
