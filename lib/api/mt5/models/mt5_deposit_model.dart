import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 response model class
abstract class MT5DepositModel extends APIBaseModel {
  /// Initializes
  MT5DepositModel({
    this.mt5Deposit,
    this.binaryTransactionId,
  });

  /// `true` on success
  final bool mt5Deposit;

  /// Withdrawal reference ID of Binary account
  final int binaryTransactionId;
}
