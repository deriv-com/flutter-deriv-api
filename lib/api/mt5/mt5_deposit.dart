import 'package:flutter_deriv_api/api/models/mt5_deposit_model.dart';

/// MT5 deposit class
class MT5Deposit extends MT5DepositModel {
  /// Class constructor
  MT5Deposit({
    int mt5Deposit,
    int binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates instance from json
  factory MT5Deposit.fromJson(Map<String, dynamic> json) => MT5Deposit(
        mt5Deposit: json['mt5_deposit'],
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Creates copy of instance with given parameters
  MT5Deposit copyWith({
    int mt5Deposit,
    int binaryTransactionId,
  }) =>
      MT5Deposit(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
