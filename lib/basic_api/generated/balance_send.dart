/// generated automatically from flutter_deriv_api|lib/basic_api/generated/balance_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'balance_send.g.dart';

/// JSON conversion for 'balance_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
  factory BalanceRequest.fromJson(Map<String, dynamic> json) =>
      _$BalanceRequestFromJson(json);

  // Properties
  /// [Optional] If set to `all`, return the balances of all accounts one by one; if set to `current`, return the balance of current account; if set as an account id, return the balance of that account.
  final String account;

  /// Must be `1`
  final int balance;

  /// [Optional] If set to 1, will send updates whenever the balance changes.
  final int subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$BalanceRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  BalanceRequest copyWith({
    String account,
    int balance,
    int subscribe,
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
