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

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final PaymentResult paymentAgentWithdraw;

  /// Payment agent name.
  final String paymentAgentName;

  /// Reference ID of withdrawal performed.
  final int transactionId;
}
