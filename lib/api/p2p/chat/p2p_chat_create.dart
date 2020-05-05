import 'package:flutter_deriv_api/api/p2p/models/p2p_chat_create_model.dart';

/// P2P chat create class
class P2PChatCreate extends P2PChatCreateModel {
  /// Initializes
  P2PChatCreate({
    String channelUrl,
    String orderId,
  }) : super(
          channelUrl: channelUrl,
          orderId: orderId,
        );

  /// Generates an instance from json
  factory P2PChatCreate.fromJson(Map<String, dynamic> json) => P2PChatCreate(
        channelUrl: json['channel_url'],
        orderId: json['order_id'],
      );

  /// Generates a copy of instance with given parameters
  P2PChatCreate copyWith({
    String channelUrl,
    String orderId,
  }) =>
      P2PChatCreate(
        channelUrl: channelUrl ?? this.channelUrl,
        orderId: orderId ?? this.orderId,
      );
}
