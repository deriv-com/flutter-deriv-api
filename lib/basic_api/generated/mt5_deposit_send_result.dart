/// Mt5 deposit send model class
abstract class Mt5DepositSendModel {
  /// Initializes
  Mt5DepositSendModel({
    @required this.mt5Deposit,
    @required this.amount,
    @required this.fromBinary,
    @required this.toMt5,
  });

  /// Must be `1`
  final int mt5Deposit;

  /// Amount to deposit (in the currency of from_binary); min = $1 or an equivalent amount, max = $20000 or an equivalent amount
  final double amount;

  /// Binary account loginid to transfer money from
  final String fromBinary;

  /// MT5 account login to deposit money to
  final String toMt5;
}

/// Mt5 deposit send class
class Mt5DepositSend extends Mt5DepositSendModel {
  /// Initializes
  Mt5DepositSend({
    @required int mt5Deposit,
    @required double amount,
    @required String fromBinary,
    @required String toMt5,
  }) : super(
          mt5Deposit: mt5Deposit,
          amount: amount,
          fromBinary: fromBinary,
          toMt5: toMt5,
        );

  /// Creates an instance from JSON
  factory Mt5DepositSend.fromJson(Map<String, dynamic> json) => Mt5DepositSend(
        mt5Deposit: json['mt5_deposit'],
        amount: getDouble(json['amount']),
        fromBinary: json['from_binary'],
        toMt5: json['to_mt5'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_deposit'] = mt5Deposit;
    result['amount'] = amount;
    result['from_binary'] = fromBinary;
    result['to_mt5'] = toMt5;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5DepositSend copyWith({
    int mt5Deposit,
    double amount,
    String fromBinary,
    String toMt5,
  }) =>
      Mt5DepositSend(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        amount: amount ?? this.amount,
        fromBinary: fromBinary ?? this.fromBinary,
        toMt5: toMt5 ?? this.toMt5,
      );
}
