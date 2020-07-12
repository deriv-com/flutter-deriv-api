/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_send.json

import '../request.dart';

/// P2pAdvertiserAdvertsRequest class
class P2pAdvertiserAdvertsRequest extends Request {
  /// Initialize P2pAdvertiserAdvertsRequest
  const P2pAdvertiserAdvertsRequest({
    this.limit,
    this.offset,
    this.p2pAdvertiserAdverts = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_advertiser_adverts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserAdvertsRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdvertsRequest(
        // ignore: avoid_as
        limit: json['limit'] as int,
        // ignore: avoid_as
        offset: json['offset'] as int,
        // ignore: avoid_as
        p2pAdvertiserAdverts: json['p2p_advertiser_adverts'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be 1
  final int p2pAdvertiserAdverts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'offset': offset,
        'p2p_advertiser_adverts': p2pAdvertiserAdverts,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsRequest copyWith({
    int limit,
    int offset,
    int p2pAdvertiserAdverts,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pAdvertiserAdvertsRequest(
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
