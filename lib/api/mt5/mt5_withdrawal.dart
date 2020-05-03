import 'package:flutter_deriv_api/api/models/mt5_withdrawal_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 withdrawal class
class MT5Withdrawal extends MT5WithdrawalModel {
  /// Initializes
  MT5Withdrawal({
    bool mt5Withdrawal,
    int binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates instance from json
  factory MT5Withdrawal.fromJson(Map<String, dynamic> json) => MT5Withdrawal(
        mt5Withdrawal: getBool(json['mt5_withdrawal']),
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Creates copy of instance with given parameters
  MT5Withdrawal copyWith({
    bool mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      MT5Withdrawal(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
