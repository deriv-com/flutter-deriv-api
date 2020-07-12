/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_chat_create_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// P2p chat create response class
class P2pChatCreateResponse extends Response {
  /// Initialize P2pChatCreateResponse
  const P2pChatCreateResponse({
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

  /// Creates an instance from JSON
  factory P2pChatCreateResponse.fromJson(Map<String, dynamic> json) =>
      P2pChatCreateResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        p2pChatCreate: json['p2p_chat_create'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Information of the P2P chat.
  final Map<String, dynamic> p2pChatCreate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_chat_create': p2pChatCreate,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pChatCreateResponse copyWith({
    Map<String, dynamic> p2pChatCreate,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pChatCreateResponse(
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
