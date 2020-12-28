/// P2p order list send model class
abstract class P2pOrderListSendModel {
  /// Initializes
  P2pOrderListSendModel({
    @required this.p2pOrderList,
    this.active,
    this.advertId,
    this.limit,
    this.offset,
    this.subscribe,
  });

  /// Must be 1
  final int p2pOrderList;

  /// [Optional] Should be 1 to list active, 0 to list inactive (historical).
  final double active;

  /// [Optional] If present, lists orders applying to a specific advert.
  final String advertId;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;

  /// [Optional] If set to 1, will send updates whenever there is a change to any order belonging to you.
  final int subscribe;
}

/// P2p order list send class
class P2pOrderListSend extends P2pOrderListSendModel {
  /// Initializes
  P2pOrderListSend({
    @required int p2pOrderList,
    double active,
    String advertId,
    int limit,
    int offset,
    int subscribe,
  }) : super(
          p2pOrderList: p2pOrderList,
          active: active,
          advertId: advertId,
          limit: limit,
          offset: offset,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory P2pOrderListSend.fromJson(Map<String, dynamic> json) =>
      P2pOrderListSend(
        p2pOrderList: json['p2p_order_list'],
        active: getDouble(json['active']),
        advertId: json['advert_id'],
        limit: json['limit'],
        offset: json['offset'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_order_list'] = p2pOrderList;
    result['active'] = active;
    result['advert_id'] = advertId;
    result['limit'] = limit;
    result['offset'] = offset;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderListSend copyWith({
    int p2pOrderList,
    double active,
    String advertId,
    int limit,
    int offset,
    int subscribe,
  }) =>
      P2pOrderListSend(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        active: active ?? this.active,
        advertId: advertId ?? this.advertId,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        subscribe: subscribe ?? this.subscribe,
      );
}
