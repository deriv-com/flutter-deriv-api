/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transfer_between_accounts_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// Transfer between accounts request class
class TransferBetweenAccountsRequest extends Request {
  /// Initialize TransferBetweenAccountsRequest
  const TransferBetweenAccountsRequest({
    this.accountFrom,
    this.accountTo,
    this.accounts,
    this.amount,
    this.currency,
    @required this.transferBetweenAccounts,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'transfer_between_accounts',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TransferBetweenAccountsRequest.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccountsRequest(
        accountFrom: json['account_from'] as String,
        accountTo: json['account_to'] as String,
        accounts: json['accounts'] as String,
        amount: json['amount'] as num,
        currency: json['currency'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        transferBetweenAccounts: json['transfer_between_accounts'] as int,
      );

  /// [Optional] The loginid of the account to transfer funds from.
  final String accountFrom;

  /// [Optional] The loginid of the account to transfer funds to.
  final String accountTo;

  /// [Optional] To control the list of accounts returned when `account_from` or `account_to` is not provided. `brief` will only include financial trading accounts with account_type equal to `binary` and can be faster. `all` will include accounts with both `mt5` and `binary` account_type
  final String accounts;

  /// [Optional] The amount to transfer.
  final num amount;

  /// [Optional] Currency code.
  final String currency;

  /// If `account_from` or `account_to` is not provided, it just returns the available accounts.
  final int transferBetweenAccounts;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_from': accountFrom,
        'account_to': accountTo,
        'accounts': accounts,
        'amount': amount,
        'currency': currency,
        'passthrough': passthrough,
        'req_id': reqId,
        'transfer_between_accounts': transferBetweenAccounts,
      };

  /// Creates a copy of instance with given parameters
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
