/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payment_methods_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Payment methods receive class.
class PaymentMethodsReceive extends Response {
  /// Initialize PaymentMethodsReceive.
  const PaymentMethodsReceive({
    this.paymentMethods,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentMethodsReceive.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsReceive(
        paymentMethods: (json['payment_methods'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Available payment methods for a given country. Note: if a user is logged in, the residence country will be considered.
  final List<Map<String, dynamic>>? paymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'payment_methods': paymentMethods,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentMethodsReceive copyWith({
    List<Map<String, dynamic>>? paymentMethods,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      PaymentMethodsReceive(
        paymentMethods: paymentMethods ?? this.paymentMethods,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
