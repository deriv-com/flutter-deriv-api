/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_stats_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// P2p advertiser stats request class
class P2pAdvertiserStatsRequest extends Request {
  /// Initialize P2pAdvertiserStatsRequest
  const P2pAdvertiserStatsRequest({
    this.days,
    this.id,
    this.p2pAdvertiserStats = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_stats',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStatsRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStatsRequest(
        days: json['days'] as int,
        id: json['id'] as String,
        p2pAdvertiserStats: json['p2p_advertiser_stats'] == null
            ? null
            : json['p2p_advertiser_stats'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] The time period to create statistics for, in days. If not provided, 30 days will be used.
  final int days;

  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser statistics of the current account.
  final String id;

  /// Must be `true`
  final bool p2pAdvertiserStats;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'days': days,
        'id': id,
        'p2p_advertiser_stats': p2pAdvertiserStats == null
            ? null
            : p2pAdvertiserStats
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserStatsRequest copyWith({
    int days,
    String id,
    bool p2pAdvertiserStats,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserStatsRequest(
        days: days ?? this.days,
        id: id ?? this.id,
        p2pAdvertiserStats: p2pAdvertiserStats ?? this.p2pAdvertiserStats,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
