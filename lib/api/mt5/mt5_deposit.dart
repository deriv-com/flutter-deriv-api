import 'package:flutter_deriv_api/api/mt5/models/mt5_deposit_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 deposit class
class MT5Deposit extends MT5DepositModel {
  /// Initializes
  MT5Deposit({
    bool mt5Deposit,
    int binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON
  factory MT5Deposit.fromJson(Map<String, dynamic> json) => MT5Deposit(
        mt5Deposit: getBool(json['mt5_deposit']),
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Creates a copy of instance with given parameters
  MT5Deposit copyWith({
    bool mt5Deposit,
    int binaryTransactionId,
  }) =>
      MT5Deposit(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
