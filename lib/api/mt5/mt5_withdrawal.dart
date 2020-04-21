import 'package:flutter_deriv_api/api/models/mt5_withdrawal_model.dart';

/// MT5 withdrawal class
class MT5Withdrawal extends MT5WithdrawalModel {
  /// Class constructor
  MT5Withdrawal({
    int mt5Withdrawal,
    int binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates instance from json
  factory MT5Withdrawal.fromJson(Map<String, dynamic> json) => MT5Withdrawal(
        mt5Withdrawal: json['mt5_withdrawal'],
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Creates copy of instance with given parameters
  MT5Withdrawal copyWith({
    int mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      MT5Withdrawal(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
