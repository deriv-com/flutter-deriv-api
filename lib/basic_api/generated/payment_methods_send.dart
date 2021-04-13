/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payment_methods_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Payment methods request class
class PaymentMethodsRequest extends Request {
  /// Initialize PaymentMethodsRequest
  const PaymentMethodsRequest({
    this.country,
    this.paymentMethods = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'payment_methods',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentMethodsRequest.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsRequest(
        country: json['country'] as String,
        paymentMethods: json['payment_methods'] == null
            ? null
            : json['payment_methods'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] 2-letter country code (ISO standard).
  final String? country;

  /// Must be `true`
  final bool? paymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'payment_methods': paymentMethods == null
            ? null
            : paymentMethods!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentMethodsRequest copyWith({
    String? country,
    bool? paymentMethods,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PaymentMethodsRequest(
        country: country ?? this.country,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
