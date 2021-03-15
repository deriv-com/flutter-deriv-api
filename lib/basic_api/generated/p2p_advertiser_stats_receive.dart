/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_stats_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// P2p advertiser stats receive class
class P2pAdvertiserStatsReceive extends Response {
  /// Initialize P2pAdvertiserStatsReceive
  const P2pAdvertiserStatsReceive({
    this.p2pAdvertiserStats,
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
  factory P2pAdvertiserStatsReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStatsReceive(
        p2pAdvertiserStats:
            json['p2p_advertiser_stats'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// P2P advertiser statistics.
  final Map<String, dynamic> p2pAdvertiserStats;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_stats': p2pAdvertiserStats,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserStatsReceive copyWith({
    Map<String, dynamic> p2pAdvertiserStats,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertiserStatsReceive(
        p2pAdvertiserStats: p2pAdvertiserStats ?? this.p2pAdvertiserStats,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}