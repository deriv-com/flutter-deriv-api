// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/transfer_between_accounts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/transfer_between_accounts_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

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
    super.transferBetweenAccounts,
    super.accounts,
    super.clientToFullName,
    super.clientToLoginid,
    super.transactionId,
  });

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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// This call allows transfers between accounts held by a given user.
  ///
  /// Transfer funds between your fiat and crypto currency accounts (for a fee).
  /// Please note that account_from should be same as current authorized account.
  /// For parameters information refer to [TransferBetweenAccountsRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<TransferBetweenAccountsResponse> transfer(
    TransferBetweenAccountsRequest request,
  ) async {
    final TransferBetweenAccountsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
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

/// AccountCategoryEnum mapper.
final Map<String, AccountCategoryEnum> accountCategoryEnumMapper =
    <String, AccountCategoryEnum>{
  "trading": AccountCategoryEnum.trading,
  "wallet": AccountCategoryEnum.wallet,
};

/// AccountCategory Enum.
enum AccountCategoryEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "binary": AccountTypeEnum.binary,
  "crypto": AccountTypeEnum.crypto,
  "ctrader": AccountTypeEnum.ctrader,
  "doughflow": AccountTypeEnum.doughflow,
  "dxtrade": AccountTypeEnum.dxtrade,
  "derivez": AccountTypeEnum.derivez,
  "mt5": AccountTypeEnum.mt5,
  "p2p": AccountTypeEnum.p2p,
  "paymentagent": AccountTypeEnum.paymentagent,
  "paymentagent_client": AccountTypeEnum.paymentagentClient,
  "standard": AccountTypeEnum.standard,
  "virtual": AccountTypeEnum.virtual,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// binary.
  binary,

  /// crypto.
  crypto,

  /// ctrader.
  ctrader,

  /// doughflow.
  doughflow,

  /// dxtrade.
  dxtrade,

  /// derivez.
  derivez,

  /// mt5.
  mt5,

  /// p2p.
  p2p,

  /// paymentagent.
  paymentagent,

  /// paymentagent_client.
  paymentagentClient,

  /// standard.
  standard,

  /// virtual.
  virtual,
}

/// MarketTypeEnum mapper.
final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "all": MarketTypeEnum.all,
  "financial": MarketTypeEnum.financial,
  "synthetic": MarketTypeEnum.synthetic,
};

/// MarketType Enum.
enum MarketTypeEnum {
  /// all.
  all,

  /// financial.
  financial,

  /// synthetic.
  synthetic,
}

/// TransfersEnum mapper.
final Map<String, TransfersEnum> transfersEnumMapper = <String, TransfersEnum>{
  "all": TransfersEnum.all,
  "deposit": TransfersEnum.deposit,
  "none": TransfersEnum.none,
  "withdrawal": TransfersEnum.withdrawal,
};

/// Transfers Enum.
enum TransfersEnum {
  /// all.
  all,

  /// deposit.
  deposit,

  /// none.
  none,

  /// withdrawal.
  withdrawal,
}
/// Accounts item model class.
abstract class AccountsItemModel {
  /// Initializes Accounts item model class .
  const AccountsItemModel({
    this.accountCategory,
    this.accountType,
    this.balance,
    this.currency,
    this.demoAccount,
    this.derivezGroup,
    this.loginid,
    this.marketType,
    this.mt5Group,
    this.status,
    this.transfers,
  });

  /// Category of the account.
  final AccountCategoryEnum? accountCategory;

  /// Type of the account.
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

  /// Type of transfers allowed between the account and the currently authorized account.
  final TransfersEnum? transfers;
}

/// Accounts item class.
class AccountsItem extends AccountsItemModel {
  /// Initializes Accounts item class.
  const AccountsItem({
    super.accountCategory,
    super.accountType,
    super.balance,
    super.currency,
    super.demoAccount,
    super.derivezGroup,
    super.loginid,
    super.marketType,
    super.mt5Group,
    super.status,
    super.transfers,
  });

  /// Creates an instance from JSON.
  factory AccountsItem.fromJson(Map<String, dynamic> json) => AccountsItem(
        accountCategory: json['account_category'] == null
            ? null
            : accountCategoryEnumMapper[json['account_category']],
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
        transfers: json['transfers'] == null
            ? null
            : transfersEnumMapper[json['transfers']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = accountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, AccountCategoryEnum> entry) =>
            entry.value == accountCategory)
        .key;
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
    resultMap['transfers'] = transfersEnumMapper.entries
        .firstWhere(
            (MapEntry<String, TransfersEnum> entry) => entry.value == transfers)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountsItem copyWith({
    AccountCategoryEnum? accountCategory,
    AccountTypeEnum? accountType,
    String? balance,
    String? currency,
    bool? demoAccount,
    String? derivezGroup,
    String? loginid,
    MarketTypeEnum? marketType,
    String? mt5Group,
    String? status,
    TransfersEnum? transfers,
  }) =>
      AccountsItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        demoAccount: demoAccount ?? this.demoAccount,
        derivezGroup: derivezGroup ?? this.derivezGroup,
        loginid: loginid ?? this.loginid,
        marketType: marketType ?? this.marketType,
        mt5Group: mt5Group ?? this.mt5Group,
        status: status ?? this.status,
        transfers: transfers ?? this.transfers,
      );
}
