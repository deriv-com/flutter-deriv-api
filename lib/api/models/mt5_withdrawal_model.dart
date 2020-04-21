import 'package:flutter_deriv_api/api/models/base_model.dart';

/// MT5 withdrawal model class
abstract class MT5WithdrawalModel extends BaseModel {
  /// Class constructor
  MT5WithdrawalModel({
    this.mt5Withdrawal,
    this.binaryTransactionId,
  });

  /// `1` on success
  final int mt5Withdrawal;

  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;
}
