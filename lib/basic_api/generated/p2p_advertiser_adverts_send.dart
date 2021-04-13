/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_adverts_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// P2p advertiser adverts request class
class P2pAdvertiserAdvertsRequest extends Request {
  /// Initialize P2pAdvertiserAdvertsRequest
  const P2pAdvertiserAdvertsRequest({
    this.limit,
    this.offset,
    this.p2pAdvertiserAdverts = true,
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
        limit: json['limit'] as int,
        offset: json['offset'] as int,
        p2pAdvertiserAdverts: json['p2p_advertiser_adverts'] == null
            ? null
            : json['p2p_advertiser_adverts'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] Used for paging.
  final int? limit;

  /// [Optional] Used for paging.
  final int? offset;

  /// Must be `true`
  final bool? p2pAdvertiserAdverts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'offset': offset,
        'p2p_advertiser_adverts': p2pAdvertiserAdverts == null
            ? null
            : p2pAdvertiserAdverts!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserAdvertsRequest copyWith({
    int? limit,
    int? offset,
    bool? p2pAdvertiserAdverts,
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
  List<Object> get props => <Object>[];
}
