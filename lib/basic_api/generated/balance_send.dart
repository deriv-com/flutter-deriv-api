/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/balance_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Balance send class
class BalanceSend extends Request {
  /// Initialize BalanceSend
  const BalanceSend({
    this.account,
    this.balance = true,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'balance',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory BalanceSend.fromJson(Map<String, dynamic> json) => BalanceSend(
        account: json['account'] as String,
        balance: json['balance'] == null ? null : json['balance'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] If set to `all`, return the balances of all accounts one by one; if set to `current`, return the balance of current account; if set as an account id, return the balance of that account.
  final String account;

  /// Must be `true`
  final bool balance;

  /// [Optional] If set to `true`, will send updates whenever the balance changes.
  final bool subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account': account,
        'balance': balance == null
            ? null
            : balance
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BalanceSend copyWith({
    String account,
    bool balance,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      BalanceSend(
        account: account ?? this.account,
        balance: balance ?? this.balance,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
