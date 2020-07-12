/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/balance_send.json

import '../request.dart';

/// BalanceRequest class
class BalanceRequest extends Request {
  /// Initialize BalanceRequest
  const BalanceRequest({
    this.account,
    this.balance = 1,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'balance',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory BalanceRequest.fromJson(Map<String, dynamic> json) => BalanceRequest(
        // ignore: avoid_as
        account: json['account'] as String,
        // ignore: avoid_as
        balance: json['balance'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
      );

  /// [Optional] If set to `all`, return the balances of all accounts one by one; if set to `current`, return the balance of current account; if set as an account id, return the balance of that account.
  final String account;

  /// Must be `1`
  final int balance;

  /// [Optional] If set to 1, will send updates whenever the balance changes.
  final bool subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account': account,
        'balance': balance,
        'passthrough': passthrough,
        'req_id': reqId,
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  BalanceRequest copyWith({
    String account,
    int balance,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      BalanceRequest(
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
