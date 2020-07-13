/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_chat_create_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// P2p chat create request class
class P2pChatCreateRequest extends Request {
  /// Initialize P2pChatCreateRequest
  const P2pChatCreateRequest({
    @required this.orderId,
    this.p2pChatCreate = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'p2p_chat_create',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pChatCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pChatCreateRequest(
        orderId: json['order_id'] as String,
        p2pChatCreate: json['p2p_chat_create'] == null
            ? null
            : json['p2p_chat_create'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// The unique identifier for the order to create the chat for.
  final String orderId;

  /// Must be `true`
  final bool p2pChatCreate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'order_id': orderId,
        'p2p_chat_create': p2pChatCreate == null ? null : p2pChatCreate ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pChatCreateRequest copyWith({
    String orderId,
    bool p2pChatCreate,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      P2pChatCreateRequest(
        orderId: orderId ?? this.orderId,
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
