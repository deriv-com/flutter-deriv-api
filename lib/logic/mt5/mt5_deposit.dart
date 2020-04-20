import 'package:flutter_deriv_api/models/mt5/mt5_deposit.dart';

/// MT5 deposit class
class MT5DepositResponse extends MT5DepositModel {
  /// Class constructor
  MT5DepositResponse({
    int mt5Deposit,
    int binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates instance from json
  factory MT5DepositResponse.fromJson(Map<String, dynamic> json) =>
      MT5DepositResponse(
        mt5Deposit: json['mt5_deposit'],
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Creates copy of instance with given parameters
  MT5DepositResponse copyWith({
    int mt5Deposit,
    int binaryTransactionId,
  }) =>
      MT5DepositResponse(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
