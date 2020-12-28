/// Transaction send model class
abstract class TransactionSendModel {
  /// Initializes
  TransactionSendModel({
    @required this.transaction,
    @required this.subscribe,
  });

  /// Must be `1`
  final int transaction;

  /// If set to 1, will send updates whenever there is an update to transactions. If not to 1 then it will not return any records.
  final int subscribe;
}

/// Transaction send class
class TransactionSend extends TransactionSendModel {
  /// Initializes
  TransactionSend({
    @required int transaction,
    @required int subscribe,
  }) : super(
          transaction: transaction,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory TransactionSend.fromJson(Map<String, dynamic> json) =>
      TransactionSend(
        transaction: json['transaction'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['transaction'] = transaction;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TransactionSend copyWith({
    int transaction,
    int subscribe,
  }) =>
      TransactionSend(
        transaction: transaction ?? this.transaction,
        subscribe: subscribe ?? this.subscribe,
      );
}
