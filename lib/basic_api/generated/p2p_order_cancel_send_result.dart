/// P2p order cancel send model class
abstract class P2pOrderCancelSendModel {
  /// Initializes
  P2pOrderCancelSendModel({
    @required this.p2pOrderCancel,
    @required this.id,
  });

  /// Must be 1
  final int p2pOrderCancel;

  /// The unique identifier for this order.
  final String id;
}

/// P2p order cancel send class
class P2pOrderCancelSend extends P2pOrderCancelSendModel {
  /// Initializes
  P2pOrderCancelSend({
    @required int p2pOrderCancel,
    @required String id,
  }) : super(
          p2pOrderCancel: p2pOrderCancel,
          id: id,
        );

  /// Creates an instance from JSON
  factory P2pOrderCancelSend.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelSend(
        p2pOrderCancel: json['p2p_order_cancel'],
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_order_cancel'] = p2pOrderCancel;
    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderCancelSend copyWith({
    int p2pOrderCancel,
    String id,
  }) =>
      P2pOrderCancelSend(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
        id: id ?? this.id,
      );
}
