import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Payment agent withdraw model class
abstract class PaymentAgentWithdrawModel extends BaseModel {
  /// Class constructor
  PaymentAgentWithdrawModel({
    this.paymentagentWithdraw,
    this.paymentagentName,
    this.transactionId,
  });

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final PaymentResult paymentagentWithdraw;

  /// Payment agent name.
  final String paymentagentName;

  /// Reference ID of withdrawal performed.
  final int transactionId;
}
