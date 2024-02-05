/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order list request class.
class P2pOrderListRequest extends Request {
  /// Initialize P2pOrderListRequest.
  const P2pOrderListRequest({
    this.active,
    this.advertId,
    this.dateFrom,
    this.dateTo,
    this.limit,
    this.loginid,
    this.offset,
    this.p2pOrderList = true,
    this.subscribe,
    super.msgType = 'p2p_order_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderListRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderListRequest(
        active: json['active'] as num?,
        advertId: json['advert_id'] as String?,
        dateFrom: json['date_from'] as String?,
        dateTo: json['date_to'] as String?,
        limit: json['limit'] as int?,
        loginid: json['loginid'] as String?,
        offset: json['offset'] as int?,
        p2pOrderList:
            json['p2p_order_list'] == null ? null : json['p2p_order_list'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Should be 1 to list active, 0 to list inactive (historical).
  final num? active;

  /// [Optional] If present, lists orders applying to a specific advert.
  final String? advertId;

  /// [Optional] Filter the orders created after this date(included) format(epoch or YYYY-MM-DD)
  final String? dateFrom;

  /// [Optional] Filter the orders created before this date(included) format(epoch or YYYY-MM-DD)
  final String? dateTo;

  /// [Optional] Used for paging.
  final int? limit;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used for paging.
  final int? offset;

  /// Must be `true`
  final bool? p2pOrderList;

  /// [Optional] If set to `true`, will send updates whenever there is a change to any order belonging to you.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'active': active,
        'advert_id': advertId,
        'date_from': dateFrom,
        'date_to': dateTo,
        'limit': limit,
        'loginid': loginid,
        'offset': offset,
        'p2p_order_list': p2pOrderList == null
            ? null
            : p2pOrderList!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderListRequest copyWith({
    num? active,
    String? advertId,
    String? dateFrom,
    String? dateTo,
    int? limit,
    String? loginid,
    int? offset,
    bool? p2pOrderList,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderListRequest(
        active: active ?? this.active,
        advertId: advertId ?? this.advertId,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        limit: limit ?? this.limit,
        loginid: loginid ?? this.loginid,
        offset: offset ?? this.offset,
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
