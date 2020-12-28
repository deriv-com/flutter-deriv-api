/// P2p order confirm send model class
abstract class P2pOrderConfirmSendModel {
  /// Initializes
  P2pOrderConfirmSendModel({
    @required this.p2pOrderConfirm,
    @required this.id,
  });

  /// Must be 1
  final int p2pOrderConfirm;

  /// The unique identifier for this order.
  final String id;
}

/// P2p order confirm send class
class P2pOrderConfirmSend extends P2pOrderConfirmSendModel {
  /// Initializes
  P2pOrderConfirmSend({
    @required int p2pOrderConfirm,
    @required String id,
  }) : super(
          p2pOrderConfirm: p2pOrderConfirm,
          id: id,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirmSend.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirmSend(
        p2pOrderConfirm: json['p2p_order_confirm'],
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_order_confirm'] = p2pOrderConfirm;
    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderConfirmSend copyWith({
    int p2pOrderConfirm,
    String id,
  }) =>
      P2pOrderConfirmSend(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        id: id ?? this.id,
      );
}
