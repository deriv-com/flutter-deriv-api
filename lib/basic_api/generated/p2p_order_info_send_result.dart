/// P2p order info send model class
abstract class P2pOrderInfoSendModel {
  /// Initializes
  P2pOrderInfoSendModel({
    @required this.p2pOrderInfo,
    @required this.id,
    this.subscribe,
  });

  /// Must be 1
  final int p2pOrderInfo;

  /// The unique identifier for the order.
  final String id;

  /// [Optional] If set to 1, will send updates whenever there is an update to order
  final int subscribe;
}

/// P2p order info send class
class P2pOrderInfoSend extends P2pOrderInfoSendModel {
  /// Initializes
  P2pOrderInfoSend({
    @required int p2pOrderInfo,
    @required String id,
    int subscribe,
  }) : super(
          p2pOrderInfo: p2pOrderInfo,
          id: id,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory P2pOrderInfoSend.fromJson(Map<String, dynamic> json) =>
      P2pOrderInfoSend(
        p2pOrderInfo: json['p2p_order_info'],
        id: json['id'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_order_info'] = p2pOrderInfo;
    result['id'] = id;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderInfoSend copyWith({
    int p2pOrderInfo,
    String id,
    int subscribe,
  }) =>
      P2pOrderInfoSend(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        id: id ?? this.id,
        subscribe: subscribe ?? this.subscribe,
      );
}
