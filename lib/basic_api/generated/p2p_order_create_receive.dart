/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_receive.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p order create response class.
class P2pOrderCreateResponse extends Response {
  /// Initialize P2pOrderCreateResponse.
  const P2pOrderCreateResponse({
    this.p2pOrderCreate,
    this.subscription,
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
  factory P2pOrderCreateResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: json['p2p_order_create'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Information of the creates P2P order.
  final Map<String, dynamic>? p2pOrderCreate;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_order_create': p2pOrderCreate,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderCreateResponse copyWith({
    Map<String, dynamic>? p2pOrderCreate,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
