import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Paymentagent transfer model class
abstract class PaymentAgentTransferModel extends BaseModel {
  /// Class constructor
  PaymentAgentTransferModel({
    this.paymentAgentTransfer,
    this.clientToFullName,
    this.clientToLoginid,
    this.transactionId,
  });

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final PaymentAgentTransfer paymentAgentTransfer;

  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;
}
