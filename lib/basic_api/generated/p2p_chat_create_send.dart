/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_chat_create_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'p2p_chat_create_send.g.dart';

/// JSON conversion for 'p2p_chat_create_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pChatCreateRequest extends Request {
  /// Initialize P2pChatCreateRequest
  const P2pChatCreateRequest({
    this.orderId,
    this.p2pChatCreate = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pChatCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$P2pChatCreateRequestFromJson(json);

  // Properties
  /// The unique identifier for the order to create the chat for.
  final String orderId;

  /// Must be 1
  final int p2pChatCreate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pChatCreateRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pChatCreateRequest copyWith({
    String orderId,
    int p2pChatCreate,
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
