import 'package:flutter_deriv_api/api/account/models/payment_agent_withdraw_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Payment agent withdraw class
class PaymentAgentWithdraw extends PaymentAgentWithdrawModel {
  /// Initializes
  PaymentAgentWithdraw({
    PaymentResult paymentAgentWithdraw,
    String paymentAgentName,
    int transactionId,
  }) : super(
          paymentAgentWithdraw: paymentAgentWithdraw,
          paymentAgentName: paymentAgentName,
          transactionId: transactionId,
        );

  /// Generates an instance from json
  factory PaymentAgentWithdraw.fromJson(Map<String, dynamic> json) =>
      PaymentAgentWithdraw(
        paymentAgentWithdraw:
            PaymentResult.values[json['paymentagent_withdraw']],
        paymentAgentName: json['paymentagent_name'],
        transactionId: json['transaction_id'],
      );

  /// Creates copy of instance with given parameters
  PaymentAgentWithdraw copyWith({
    PaymentResult paymentAgentWithdraw,
    String paymentAgentName,
    int transactionId,
  }) =>
      PaymentAgentWithdraw(
        paymentAgentWithdraw: paymentAgentWithdraw ?? this.paymentAgentWithdraw,
        paymentAgentName: paymentAgentName ?? this.paymentAgentName,
        transactionId: transactionId ?? this.transactionId,
      );
}
