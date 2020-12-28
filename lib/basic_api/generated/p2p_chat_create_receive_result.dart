/// P2p chat create receive model class
abstract class P2pChatCreateReceiveModel {
  /// Initializes
  P2pChatCreateReceiveModel({
    @required this.p2pChatCreate,
  });

  /// Information of the P2P chat.
  final P2pChatCreate p2pChatCreate;
}

/// P2p chat create receive class
class P2pChatCreateReceive extends P2pChatCreateReceiveModel {
  /// Initializes
  P2pChatCreateReceive({
    @required P2pChatCreate p2pChatCreate,
  }) : super(
          p2pChatCreate: p2pChatCreate,
        );

  /// Creates an instance from JSON
  factory P2pChatCreateReceive.fromJson(Map<String, dynamic> json) =>
      P2pChatCreateReceive(
        p2pChatCreate: json['p2p_chat_create'] == null
            ? null
            : P2pChatCreate.fromJson(json['p2p_chat_create']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pChatCreate != null) {
      result['p2p_chat_create'] = p2pChatCreate.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pChatCreateReceive copyWith({
    P2pChatCreate p2pChatCreate,
  }) =>
      P2pChatCreateReceive(
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
      );
}
/// P2p chat create model class
abstract class P2pChatCreateModel {
  /// Initializes
  P2pChatCreateModel({
    @required this.channelUrl,
    @required this.orderId,
  });

  /// The URL to be used to initialise the chat for the requested order.
  final String channelUrl;

  /// The unique identifier for the order that the chat belongs to.
  final String orderId;
}

/// P2p chat create class
class P2pChatCreate extends P2pChatCreateModel {
  /// Initializes
  P2pChatCreate({
    @required String channelUrl,
    @required String orderId,
  }) : super(
          channelUrl: channelUrl,
          orderId: orderId,
        );

  /// Creates an instance from JSON
  factory P2pChatCreate.fromJson(Map<String, dynamic> json) => P2pChatCreate(
        channelUrl: json['channel_url'],
        orderId: json['order_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['channel_url'] = channelUrl;
    result['order_id'] = orderId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pChatCreate copyWith({
    String channelUrl,
    String orderId,
  }) =>
      P2pChatCreate(
        channelUrl: channelUrl ?? this.channelUrl,
        orderId: orderId ?? this.orderId,
      );
}
