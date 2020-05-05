import 'package:flutter_deriv_api/api/account/models/payment_agent_transfer_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Payment agent transfer class
class PaymentAgentTransfer extends PaymentAgentTransferModel {
  /// Initializes
  PaymentAgentTransfer({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) : super(
          paymentAgentTransfer: paymentAgentTransfer,
          clientToFullName: clientToFullName,
          clientToLoginId: clientToLoginId,
          transactionId: transactionId,
        );

  /// Generates an instance from json
  factory PaymentAgentTransfer.fromJson(Map<String, dynamic> json) =>
      PaymentAgentTransfer(
        paymentAgentTransfer:
            PaymentResult.values[json['paymentagent_transfer']],
        clientToFullName: json['client_to_full_name'],
        clientToLoginId: json['client_to_loginid'],
        transactionId: json['transaction_id'],
      );

  /// Creates copy of instance with given parameters
  PaymentAgentTransfer copyWith({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) =>
      PaymentAgentTransfer(
        paymentAgentTransfer: paymentAgentTransfer ?? this.paymentAgentTransfer,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginId: clientToLoginId ?? this.clientToLoginId,
        transactionId: transactionId ?? this.transactionId,
      );
}
