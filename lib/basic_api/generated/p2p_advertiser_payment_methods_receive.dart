/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_payment_methods_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p advertiser payment methods receive class.
class P2pAdvertiserPaymentMethodsReceive extends Response {
  /// Initialize P2pAdvertiserPaymentMethodsReceive.
  const P2pAdvertiserPaymentMethodsReceive({
    this.p2pAdvertiserPaymentMethods,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserPaymentMethodsReceive.fromJson(
          Map<String, dynamic> json) =>
      P2pAdvertiserPaymentMethodsReceive(
        p2pAdvertiserPaymentMethods:
            json['p2p_advertiser_payment_methods'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of current methods.
  final Map<String, dynamic>? p2pAdvertiserPaymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_advertiser_payment_methods': p2pAdvertiserPaymentMethods,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserPaymentMethodsReceive copyWith({
    Map<String, dynamic>? p2pAdvertiserPaymentMethods,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pAdvertiserPaymentMethodsReceive(
        p2pAdvertiserPaymentMethods:
            p2pAdvertiserPaymentMethods ?? this.p2pAdvertiserPaymentMethods,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
