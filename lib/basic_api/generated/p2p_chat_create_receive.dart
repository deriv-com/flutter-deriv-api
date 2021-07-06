/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_chat_create_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p chat create receive class.
class P2pChatCreateReceive extends Response {
  /// Initialize P2pChatCreateReceive.
  const P2pChatCreateReceive({
    this.p2pChatCreate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pChatCreateReceive.fromJson(Map<String, dynamic> json) =>
      P2pChatCreateReceive(
        p2pChatCreate: json['p2p_chat_create'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information of the P2P chat.
  final Map<String, dynamic>? p2pChatCreate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_chat_create': p2pChatCreate,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pChatCreateReceive copyWith({
    Map<String, dynamic>? p2pChatCreate,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pChatCreateReceive(
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
