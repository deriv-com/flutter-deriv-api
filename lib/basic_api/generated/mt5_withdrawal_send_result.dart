/// Mt5 withdrawal send model class
abstract class Mt5WithdrawalSendModel {
  /// Initializes
  Mt5WithdrawalSendModel({
    @required this.mt5Withdrawal,
    @required this.amount,
    @required this.fromMt5,
    @required this.toBinary,
  });

  /// Must be `1`
  final int mt5Withdrawal;

  /// Amount to withdraw (in the currency of the MT5 account); min = $1 or an equivalent amount, max = $20000 or an equivalent amount.
  final double amount;

  /// MT5 account login to withdraw money from
  final String fromMt5;

  /// Binary account loginid to transfer money to
  final String toBinary;
}

/// Mt5 withdrawal send class
class Mt5WithdrawalSend extends Mt5WithdrawalSendModel {
  /// Initializes
  Mt5WithdrawalSend({
    @required int mt5Withdrawal,
    @required double amount,
    @required String fromMt5,
    @required String toBinary,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          amount: amount,
          fromMt5: fromMt5,
          toBinary: toBinary,
        );

  /// Creates an instance from JSON
  factory Mt5WithdrawalSend.fromJson(Map<String, dynamic> json) =>
      Mt5WithdrawalSend(
        mt5Withdrawal: json['mt5_withdrawal'],
        amount: getDouble(json['amount']),
        fromMt5: json['from_mt5'],
        toBinary: json['to_binary'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_withdrawal'] = mt5Withdrawal;
    result['amount'] = amount;
    result['from_mt5'] = fromMt5;
    result['to_binary'] = toBinary;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5WithdrawalSend copyWith({
    int mt5Withdrawal,
    double amount,
    String fromMt5,
    String toBinary,
  }) =>
      Mt5WithdrawalSend(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        amount: amount ?? this.amount,
        fromMt5: fromMt5 ?? this.fromMt5,
        toBinary: toBinary ?? this.toBinary,
      );
}
