/// generated automatically from flutter_deriv_api|lib/api/p2p_chat_create_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_chat_create_receive.g.dart';

/// JSON conversion for 'p2p_chat_create_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pChatCreateResponse extends Response {
  /// Initialize P2pChatCreateResponse
  P2pChatCreateResponse({
    this.p2pChatCreate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory P2pChatCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pChatCreateResponseFromJson(json);

  // Properties
  /// Information of the P2P chat.
  final Map<String, dynamic> p2pChatCreate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pChatCreateResponseToJson(this);
}
