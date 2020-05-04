/// generated automatically from flutter_deriv_api|lib/basic_api/generated/transfer_between_accounts_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'transfer_between_accounts_send.g.dart';

/// JSON conversion for 'transfer_between_accounts_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TransferBetweenAccountsRequest extends Request {
  /// Initialize TransferBetweenAccountsRequest
  const TransferBetweenAccountsRequest({
    this.accountFrom,
    this.accountTo,
    this.accounts,
    this.amount,
    this.currency,
    this.transferBetweenAccounts = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'transfer_between_accounts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory TransferBetweenAccountsRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferBetweenAccountsRequestFromJson(json);

  // Properties
  /// [Optional] The loginid of the account to transfer funds from.
  final String accountFrom;

  /// [Optional] The loginid of the account to transfer funds to.
  final String accountTo;

  /// [Optional] To control the list of accounts returned when `account_from` or `account_to` is not provided. `brief` will only include standard trading accounts and can be faster.
  final String accounts;

  /// [Optional] The amount to transfer.
  final num amount;

  /// [Optional] Currency code.
  final String currency;

  /// If `account_from` or `account_to` is not provided, it just returns the available accounts.
  final int transferBetweenAccounts;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TransferBetweenAccountsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TransferBetweenAccountsRequest copyWith({
    String accountFrom,
    String accountTo,
    String accounts,
    num amount,
    String currency,
    int transferBetweenAccounts,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TransferBetweenAccountsRequest(
        accountFrom: accountFrom ?? this.accountFrom,
        accountTo: accountTo ?? this.accountTo,
        accounts: accounts ?? this.accounts,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
