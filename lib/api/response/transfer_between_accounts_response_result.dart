// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/transfer_between_accounts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/transfer_between_accounts_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Transfer between accounts response model class.
abstract class TransferBetweenAccountsResponseModel {
  /// Initializes Transfer between accounts response model class .
  const TransferBetweenAccountsResponseModel({
    this.transferBetweenAccounts,
    this.accounts,
    this.clientToFullName,
    this.clientToLoginid,
    this.transactionId,
  });

  /// If set to `true`, transfer succeeded.
  final bool? transferBetweenAccounts;

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<AccountsItem>? accounts;

  /// The account to client full name
  final String? clientToFullName;

  /// The account to client loginid
  final String? clientToLoginid;

  /// Reference ID of transfer performed
  final int? transactionId;
}

/// Transfer between accounts response class.
class TransferBetweenAccountsResponse
    extends TransferBetweenAccountsResponseModel {
  /// Initializes Transfer between accounts response class.
  const TransferBetweenAccountsResponse({
    bool? transferBetweenAccounts,
    List<AccountsItem>? accounts,
    String? clientToFullName,
    String? clientToLoginid,
    int? transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON.
  factory TransferBetweenAccountsResponse.fromJson(
    dynamic transferBetweenAccountsJson,
    dynamic accountsJson,
    dynamic clientToFullNameJson,
    dynamic clientToLoginidJson,
    dynamic transactionIdJson,
  ) =>
      TransferBetweenAccountsResponse(
        transferBetweenAccounts: getBool(transferBetweenAccountsJson),
        accounts: accountsJson == null
            ? null
            : List<AccountsItem>.from(
                accountsJson?.map(
                  (dynamic item) => AccountsItem.fromJson(item),
                ),
              ),
        clientToFullName: clientToFullNameJson,
        clientToLoginid: clientToLoginidJson,
        transactionId: transactionIdJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['transfer_between_accounts'] = transferBetweenAccounts;
    if (accounts != null) {
      resultMap['accounts'] = accounts!
          .map<dynamic>(
            (AccountsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['client_to_full_name'] = clientToFullName;
    resultMap['client_to_loginid'] = clientToLoginid;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// This call allows transfers between accounts held by a given user.
  ///
  /// Transfer funds between your fiat and crypto currency accounts (for a fee).
  /// Please note that account_from should be same as current authorized account.
  /// For parameters information refer to [TransferBetweenAccountsRequest].
  /// Throws a [TransferException] if API response contains an error
  static Future<TransferBetweenAccountsResponse> transfer(
    TransferBetweenAccountsRequest request,
  ) async {
    final TransferBetweenAccountsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TransferException(baseExceptionModel: baseExceptionModel),
    );

    return TransferBetweenAccountsResponse.fromJson(
        response.transferBetweenAccounts,
        response.accounts,
        response.clientToFullName,
        response.clientToLoginid,
        response.transactionId);
  }

  /// Creates a copy of instance with given parameters.
  TransferBetweenAccountsResponse copyWith({
    bool? transferBetweenAccounts,
    List<AccountsItem>? accounts,
    String? clientToFullName,
    String? clientToLoginid,
    int? transactionId,
  }) =>
      TransferBetweenAccountsResponse(
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        accounts: accounts ?? this.accounts,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
      );
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "trading": AccountTypeEnum.trading,
  "mt5": AccountTypeEnum.mt5,
  "wallet": AccountTypeEnum.wallet,
  "dxtrade": AccountTypeEnum.dxtrade,
  "derivez": AccountTypeEnum.derivez,
  "binary": AccountTypeEnum.binary,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// trading.
  trading,

  /// mt5.
  mt5,

  /// wallet.
  wallet,

  /// dxtrade.
  dxtrade,

  /// derivez.
  derivez,

  /// binary.
  binary,
}

/// MarketTypeEnum mapper.
final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "financial": MarketTypeEnum.financial,
  "synthetic": MarketTypeEnum.synthetic,
  "all": MarketTypeEnum.all,
};

/// MarketType Enum.
enum MarketTypeEnum {
  /// financial.
  financial,

  /// synthetic.
  synthetic,

  /// all.
  all,
}
/// Accounts item model class.
abstract class AccountsItemModel {
  /// Initializes Accounts item model class .
  const AccountsItemModel({
    this.accountType,
    this.balance,
    this.currency,
    this.demoAccount,
    this.derivezGroup,
    this.loginid,
    this.marketType,
    this.mt5Group,
    this.status,
  });

  /// Type of the account. Please note that `binary` is deprecated and replaced by `trading`
  final AccountTypeEnum? accountType;

  /// Account balance.
  final String? balance;

  /// Default account currency.
  final String? currency;

  /// 0 for real accounts; `true` for virtual/demo accounts.
  final bool? demoAccount;

  /// The group of derivez account.
  final String? derivezGroup;

  /// Account identifier used for system transfers.
  final String? loginid;

  /// Market type of account.
  final MarketTypeEnum? marketType;

  /// The group of mt5 account.
  final String? mt5Group;

  /// The status of account.
  final String? status;
}

/// Accounts item class.
class AccountsItem extends AccountsItemModel {
  /// Initializes Accounts item class.
  const AccountsItem({
    AccountTypeEnum? accountType,
    String? balance,
    String? currency,
    bool? demoAccount,
    String? derivezGroup,
    String? loginid,
    MarketTypeEnum? marketType,
    String? mt5Group,
    String? status,
  }) : super(
          accountType: accountType,
          balance: balance,
          currency: currency,
          demoAccount: demoAccount,
          derivezGroup: derivezGroup,
          loginid: loginid,
          marketType: marketType,
          mt5Group: mt5Group,
          status: status,
        );

  /// Creates an instance from JSON.
  factory AccountsItem.fromJson(Map<String, dynamic> json) => AccountsItem(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        balance: json['balance'],
        currency: json['currency'],
        demoAccount: getBool(json['demo_account']),
        derivezGroup: json['derivez_group'],
        loginid: json['loginid'],
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']],
        mt5Group: json['mt5_group'],
        status: json['status'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['demo_account'] = demoAccount;
    resultMap['derivez_group'] = derivezGroup;
    resultMap['loginid'] = loginid;
    resultMap['market_type'] = marketTypeEnumMapper.entries
        .firstWhere((MapEntry<String, MarketTypeEnum> entry) =>
            entry.value == marketType)
        .key;
    resultMap['mt5_group'] = mt5Group;
    resultMap['status'] = status;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountsItem copyWith({
    AccountTypeEnum? accountType,
    String? balance,
    String? currency,
    bool? demoAccount,
    String? derivezGroup,
    String? loginid,
    MarketTypeEnum? marketType,
    String? mt5Group,
    String? status,
  }) =>
      AccountsItem(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        demoAccount: demoAccount ?? this.demoAccount,
        derivezGroup: derivezGroup ?? this.derivezGroup,
        loginid: loginid ?? this.loginid,
        marketType: marketType ?? this.marketType,
        mt5Group: mt5Group ?? this.mt5Group,
        status: status ?? this.status,
      );
}
