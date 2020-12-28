/// Mt5 deposit receive model class
abstract class Mt5DepositReceiveModel {
  /// Initializes
  Mt5DepositReceiveModel({
    @required this.mt5Deposit,
    @required this.binaryTransactionId,
  });

  /// 1 on success
  final int mt5Deposit;

  /// Withdrawal reference ID of Binary account
  final int binaryTransactionId;
}

/// Mt5 deposit receive class
class Mt5DepositReceive extends Mt5DepositReceiveModel {
  /// Initializes
  Mt5DepositReceive({
    @required int mt5Deposit,
    @required int binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON
  factory Mt5DepositReceive.fromJson(Map<String, dynamic> json) =>
      Mt5DepositReceive(
        mt5Deposit: json['mt5_deposit'],
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_deposit'] = mt5Deposit;
    result['binary_transaction_id'] = binaryTransactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5DepositReceive copyWith({
    int mt5Deposit,
    int binaryTransactionId,
  }) =>
      Mt5DepositReceive(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
