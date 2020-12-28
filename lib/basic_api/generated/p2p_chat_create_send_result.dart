/// P2p chat create send model class
abstract class P2pChatCreateSendModel {
  /// Initializes
  P2pChatCreateSendModel({
    @required this.p2pChatCreate,
    @required this.orderId,
  });

  /// Must be 1
  final int p2pChatCreate;

  /// The unique identifier for the order to create the chat for.
  final String orderId;
}

/// P2p chat create send class
class P2pChatCreateSend extends P2pChatCreateSendModel {
  /// Initializes
  P2pChatCreateSend({
    @required int p2pChatCreate,
    @required String orderId,
  }) : super(
          p2pChatCreate: p2pChatCreate,
          orderId: orderId,
        );

  /// Creates an instance from JSON
  factory P2pChatCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pChatCreateSend(
        p2pChatCreate: json['p2p_chat_create'],
        orderId: json['order_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_chat_create'] = p2pChatCreate;
    result['order_id'] = orderId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pChatCreateSend copyWith({
    int p2pChatCreate,
    String orderId,
  }) =>
      P2pChatCreateSend(
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
        orderId: orderId ?? this.orderId,
      );
}
