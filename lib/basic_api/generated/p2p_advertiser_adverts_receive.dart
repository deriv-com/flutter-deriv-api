/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser adverts receive class.
class P2pAdvertiserAdvertsReceive extends Response {
  /// Initialize P2pAdvertiserAdvertsReceive.
  const P2pAdvertiserAdvertsReceive({
    this.p2pAdvertiserAdverts,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdvertsReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdvertsReceive(
        p2pAdvertiserAdverts:
            json['p2p_advertiser_adverts'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of the P2P advertiser adverts.
  final Map<String, dynamic>? p2pAdvertiserAdverts;

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
  P2pAdvertiserAdvertsReceive copyWith({
    Map<String, dynamic>? p2pAdvertiserAdverts,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserAdvertsReceive(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
