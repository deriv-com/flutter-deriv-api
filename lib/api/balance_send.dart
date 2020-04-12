/// generated automatically from flutter_deriv_api|lib/api/balance_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'balance_send.g.dart';

/// JSON conversion for 'balance_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BalanceRequest extends Request {
  /// Initialize BalanceRequest
  const BalanceRequest({
    this.account,
    this.balance = 1,
    this.subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory BalanceRequest.fromJson(Map<String, dynamic> json) =>
      _$BalanceRequestFromJson(json);

  // Properties
  /// [Optional] If set to `all`, return the balances of all accounts one by one; if set to `current`, return the balance of current account; if set as an account id, return the balance of that account.
  final String account;

  /// Must be `1`
  final int balance;

  /// [Optional] If set to 1, will send updates whenever the balance changes.
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$BalanceRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  BalanceRequest copyWith({
    String account,
    int balance,
    int subscribe,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      BalanceRequest(
        account: account ?? this.account,
        balance: balance ?? this.balance,
        subscribe: subscribe ?? this.subscribe,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
