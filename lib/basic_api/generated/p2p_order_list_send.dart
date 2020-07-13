/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_list_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// P2p order list request class
class P2pOrderListRequest extends Request {
  /// Initialize P2pOrderListRequest
  const P2pOrderListRequest({
    this.active,
    this.advertId,
    this.limit,
    this.offset,
    this.p2pOrderList = true,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_order_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pOrderListRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderListRequest(
        active: json['active'] as num,
        advertId: json['advert_id'] as String,
        limit: json['limit'] as int,
        offset: json['offset'] as int,
        p2pOrderList:
            json['p2p_order_list'] == null ? null : json['p2p_order_list'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] Should be 1 to list active, 0 to list inactive (historical).
  final num active;

  /// [Optional] If present, lists orders applying to a specific advert.
  final String advertId;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;

  /// Must be `true`
  final bool p2pOrderList;

  /// [Optional] If set to 1, will send updates whenever there is a change to any order belonging to you.
  final bool subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active': active,
        'advert_id': advertId,
        'limit': limit,
        'offset': offset,
        'p2p_order_list': p2pOrderList == null ? null : p2pOrderList ? 1 : 0,
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderListRequest copyWith({
    num active,
    String advertId,
    int limit,
    int offset,
    bool p2pOrderList,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pOrderListRequest(
        active: active ?? this.active,
        advertId: advertId ?? this.advertId,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
