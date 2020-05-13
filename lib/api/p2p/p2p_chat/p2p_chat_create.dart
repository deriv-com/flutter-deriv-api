import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_chat_create_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

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

  /// Generate an instance from JSON
  factory P2PChatCreate.fromJson(Map<String, dynamic> json) => P2PChatCreate(
        channelUrl: json['channel_url'],
        orderId: json['order_id'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  P2PChatCreate copyWith({
    String channelUrl,
    String orderId,
  }) =>
      P2PChatCreate(
        channelUrl: channelUrl ?? this.channelUrl,
        orderId: orderId ?? this.orderId,
      );

  /// Creates a P2P (peer to peer) chat for the specified order.
  /// For parameters information refer to [P2pChatCreateRequest].
  static Future<P2PChatCreate> createChat(
    P2pChatCreateRequest request,
  ) async {
    final P2pChatCreateResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw P2PException(message: response.error['message']);
    }

    return P2PChatCreate.fromJson(response.p2pChatCreate);
  }
}
