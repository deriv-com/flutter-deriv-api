/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_confirm_receive.json

import '../response.dart';

/// P2pOrderConfirmResponse class
class P2pOrderConfirmResponse extends Response {
  /// Initialize P2pOrderConfirmResponse
  const P2pOrderConfirmResponse({
    this.p2pOrderConfirm,
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
  factory P2pOrderConfirmResponse.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirmResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        p2pOrderConfirm: json['p2p_order_confirm'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Confirmation details
  final Map<String, dynamic> p2pOrderConfirm;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'p2p_order_confirm': p2pOrderConfirm,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pOrderConfirmResponse copyWith({
    Map<String, dynamic> p2pOrderConfirm,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
