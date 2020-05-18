import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Payment agent withdraw model class
abstract class PaymentAgentWithdrawModel extends APIBaseModel {
  /// Initializes
  PaymentAgentWithdrawModel({
    this.paymentAgentWithdraw,
    this.paymentAgentName,
    this.transactionId,
  });

  /// If set to `withdrawalOrTransfer`, withdrawal success. If set to `dryrun`, dry-run success.
  final PaymentResult paymentAgentWithdraw;

  /// Payment agent name.
  final String paymentAgentName;

  /// Reference id of withdrawal performed.
  final int transactionId;
}
