/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_payment_methods_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p payment methods response class.
class P2pPaymentMethodsResponse extends Response {
  /// Initialize P2pPaymentMethodsResponse.
  const P2pPaymentMethodsResponse({
    this.p2pPaymentMethods,
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
  factory P2pPaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      P2pPaymentMethodsResponse(
        p2pPaymentMethods: json['p2p_payment_methods'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Payment methods keyed by identifier.
  final Map<String, dynamic>? p2pPaymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_payment_methods': p2pPaymentMethods,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pPaymentMethodsResponse copyWith({
    Map<String, dynamic>? p2pPaymentMethods,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pPaymentMethodsResponse(
        p2pPaymentMethods: p2pPaymentMethods ?? this.p2pPaymentMethods,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
