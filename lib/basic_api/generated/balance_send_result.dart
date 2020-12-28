/// Balance send model class
abstract class BalanceSendModel {
  /// Initializes
  BalanceSendModel({
    @required this.balance,
    this.account,
    this.subscribe,
  });

  /// Must be `1`
  final int balance;

  /// [Optional] If set to `all`, return the balances of all accounts one by one; if set to `current`, return the balance of current account; if set as an account id, return the balance of that account.
  final String account;

  /// [Optional] If set to `true`, will send updates whenever the balance changes.
  final bool subscribe;
}

/// Balance send class
class BalanceSend extends BalanceSendModel {
  /// Initializes
  BalanceSend({
    @required int balance,
    String account,
    bool subscribe,
  }) : super(
          balance: balance,
          account: account,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory BalanceSend.fromJson(Map<String, dynamic> json) => BalanceSend(
        balance: json['balance'],
        account: json['account'],
        subscribe: getBool(json['subscribe']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance'] = balance;
    result['account'] = account;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  BalanceSend copyWith({
    int balance,
    String account,
    bool subscribe,
  }) =>
      BalanceSend(
        balance: balance ?? this.balance,
        account: account ?? this.account,
        subscribe: subscribe ?? this.subscribe,
      );
}
