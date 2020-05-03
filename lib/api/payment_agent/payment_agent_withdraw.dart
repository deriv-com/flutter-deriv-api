import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/payment_agent_withdraw_model.dart';

/// Payment agent withdraw class
class PaymentAgentWithdraw extends PaymentAgentWithdrawModel {
  /// Initializes
  PaymentAgentWithdraw({
    PaymentResult paymentagentWithdraw,
    String paymentagentName,
    int transactionId,
  }) : super(
          paymentagentWithdraw: paymentagentWithdraw,
          paymentagentName: paymentagentName,
          transactionId: transactionId,
        );

  /// Creates instance from json
  factory PaymentAgentWithdraw.fromJson(Map<String, dynamic> json) =>
      PaymentAgentWithdraw(
        paymentagentWithdraw:
            PaymentResult.values[json['paymentagent_withdraw']],
        paymentagentName: json['paymentagent_name'],
        transactionId: json['transaction_id'],
      );

  /// Creates copy of instance with given parameters
  PaymentAgentWithdraw copyWith({
    PaymentResult paymentagentWithdraw,
    String paymentagentName,
    int transactionId,
  }) =>
      PaymentAgentWithdraw(
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        paymentagentName: paymentagentName ?? this.paymentagentName,
        transactionId: transactionId ?? this.transactionId,
      );
}
