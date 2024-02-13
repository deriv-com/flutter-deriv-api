/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/payment_methods_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Payment methods request class.
class PaymentMethodsRequest extends Request {
  /// Initialize PaymentMethodsRequest.
  const PaymentMethodsRequest({
    this.country,
    this.loginid,
    this.paymentMethods = true,
    super.msgType = 'payment_methods',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentMethodsRequest.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsRequest(
        country: json['country'] as String?,
        loginid: json['loginid'] as String?,
        paymentMethods: json['payment_methods'] == null
            ? null
            : json['payment_methods'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] 2-letter country code (ISO standard).
  final String? country;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? paymentMethods;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'loginid': loginid,
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
    String? loginid,
    bool? paymentMethods,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentMethodsRequest(
        country: country ?? this.country,
        loginid: loginid ?? this.loginid,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
