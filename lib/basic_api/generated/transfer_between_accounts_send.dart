/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/transfer_between_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Transfer between accounts request class.
class TransferBetweenAccountsRequest extends Request {
  /// Initialize TransferBetweenAccountsRequest.
  const TransferBetweenAccountsRequest({
    this.accountFrom,
    this.accountTo,
    this.accounts,
    this.amount,
    this.currency,
    this.loginid,
    required this.transferBetweenAccounts,
    super.msgType = 'transfer_between_accounts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TransferBetweenAccountsRequest.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccountsRequest(
        accountFrom: json['account_from'] as String?,
        accountTo: json['account_to'] as String?,
        accounts: json['accounts'] as String?,
        amount: json['amount'] as num?,
        currency: json['currency'] as String?,
        loginid: json['loginid'] as String?,
        transferBetweenAccounts: json['transfer_between_accounts'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The loginid of the account to transfer funds from.
  final String? accountFrom;

  /// [Optional] The loginid of the account to transfer funds to.
  final String? accountTo;

  /// [Optional] To control the list of accounts returned when `account_from` or `account_to` is not provided. `brief` (default value) means that accounts with `mt5` account_type will be excluded; it will run faster. `all` means that all accounts with any account_type (including `mt5`) will be returned.
  final String? accounts;

  /// [Optional] The amount to transfer.
  final num? amount;

  /// [Optional] Currency code.
  final String? currency;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// If `account_from` or `account_to` is not provided, it just returns the available accounts.
  final int? transferBetweenAccounts;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_from': accountFrom,
        'account_to': accountTo,
        'accounts': accounts,
        'amount': amount,
        'currency': currency,
        'loginid': loginid,
        'transfer_between_accounts': transferBetweenAccounts,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TransferBetweenAccountsRequest copyWith({
    String? accountFrom,
    String? accountTo,
    String? accounts,
    num? amount,
    String? currency,
    String? loginid,
    int? transferBetweenAccounts,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TransferBetweenAccountsRequest(
        accountFrom: accountFrom ?? this.accountFrom,
        accountTo: accountTo ?? this.accountTo,
        accounts: accounts ?? this.accounts,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
