import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Payment agent transfer model class
abstract class PaymentAgentTransferModel extends APIBaseModel {
  /// Initializes
  PaymentAgentTransferModel({
    this.paymentAgentTransfer,
    this.clientToFullName,
    this.clientToLoginId,
    this.transactionId,
  });

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final PaymentResult paymentAgentTransfer;

  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client login id
  final String clientToLoginId;

  /// Reference ID of transfer performed
  final int transactionId;
}
