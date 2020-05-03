import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/payment_agent_transfer_model.dart';

/// Payment agent transfer class
class PaymentAgentTransfer extends PaymentAgentTransferModel {
  /// Class constructor
  PaymentAgentTransfer({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) : super(
          paymentAgentTransfer: paymentAgentTransfer,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates instance from json
  factory PaymentAgentTransfer.fromJson(Map<String, dynamic> json) =>
      PaymentAgentTransfer(
        paymentAgentTransfer:
            PaymentResult.values[json['paymentagent_transfer']],
        clientToFullName: json['client_to_full_name'],
        clientToLoginid: json['client_to_loginid'],
        transactionId: json['transaction_id'],
      );

  /// Creates copy of instance with given parameters
  PaymentAgentTransfer copyWith({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) =>
      PaymentAgentTransfer(
        paymentAgentTransfer: paymentAgentTransfer ?? this.paymentAgentTransfer,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
      );
}
