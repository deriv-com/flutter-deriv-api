import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 withdrawal model class
abstract class MT5WithdrawalModel extends BaseModel {
  /// Initializes
  MT5WithdrawalModel({
    this.mt5Withdrawal,
    this.binaryTransactionId,
  });

  /// `true` on success
  final bool mt5Withdrawal;

  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;
}
