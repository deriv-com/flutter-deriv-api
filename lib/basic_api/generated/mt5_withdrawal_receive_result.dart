/// Mt5 withdrawal receive model class
abstract class Mt5WithdrawalReceiveModel {
  /// Initializes
  Mt5WithdrawalReceiveModel({
    @required this.mt5Withdrawal,
    @required this.binaryTransactionId,
  });

  /// `1` on success
  final int mt5Withdrawal;

  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;
}

/// Mt5 withdrawal receive class
class Mt5WithdrawalReceive extends Mt5WithdrawalReceiveModel {
  /// Initializes
  Mt5WithdrawalReceive({
    @required int mt5Withdrawal,
    @required int binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON
  factory Mt5WithdrawalReceive.fromJson(Map<String, dynamic> json) =>
      Mt5WithdrawalReceive(
        mt5Withdrawal: json['mt5_withdrawal'],
        binaryTransactionId: json['binary_transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_withdrawal'] = mt5Withdrawal;
    result['binary_transaction_id'] = binaryTransactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5WithdrawalReceive copyWith({
    int mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      Mt5WithdrawalReceive(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
