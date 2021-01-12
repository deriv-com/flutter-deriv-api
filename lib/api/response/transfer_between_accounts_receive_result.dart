import 'package:meta/meta.dart';

import '../../basic_api/generated/transfer_between_accounts_receive.dart';
import '../../basic_api/generated/transfer_between_accounts_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Transfer between accounts response model class
abstract class TransferBetweenAccountsResponseModel {
  /// Initializes
  TransferBetweenAccountsResponseModel({
    @required this.transferBetweenAccounts,
    @required this.accounts,
    @required this.clientToFullName,
    @required this.clientToLoginid,
    @required this.transactionId,
  });

  /// If set to `true`, transfer succeeded.
  final bool transferBetweenAccounts;

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<AccountsItem> accounts;

  /// The account to client full name
  final String clientToFullName;

  /// The account to client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;
}

/// Transfer between accounts response class
class TransferBetweenAccountsResponse
    extends TransferBetweenAccountsResponseModel {
  /// Initializes
  TransferBetweenAccountsResponse({
    @required bool transferBetweenAccounts,
    @required List<AccountsItem> accounts,
    @required String clientToFullName,
    @required String clientToLoginid,
    @required int transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
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
            : List<AccountsItem>.from(accountsJson
                .map((dynamic item) => AccountsItem.fromJson(item))),
        clientToFullName: clientToFullNameJson,
        clientToLoginid: clientToLoginidJson,
        transactionId: transactionIdJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['transfer_between_accounts'] = transferBetweenAccounts;
    if (accounts != null) {
      resultMap['accounts'] =
          accounts.map<dynamic>((AccountsItem item) => item.toJson()).toList();
    }
    resultMap['client_to_full_name'] = clientToFullName;
    resultMap['client_to_loginid'] = clientToLoginid;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// This call allows transfers between accounts held by a given user.
  ///
  /// Transfer funds between your fiat and crypto currency accounts (for a fee).
  /// Please note that account_from should be same as current authorized account.
  /// For parameters information refer to [TransferBetweenAccountsRequest].
  /// Throws a [TransferException] if API response contains an error
  static Future<TransferBetweenAccountsResponse> transfer(
    TransferBetweenAccountsSend request,
  ) async {
    final TransferBetweenAccountsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TransferException(baseExceptionModel: baseExceptionModel),
    );

    return TransferBetweenAccountsResponse.fromJson(
        response.transferBetweenAccounts,
        response.accounts,
        response.clientToFullName,
        response.clientToLoginid,
        response.transactionId);
  }

  /// Creates a copy of instance with given parameters
  TransferBetweenAccountsResponse copyWith({
    bool transferBetweenAccounts,
    List<AccountsItem> accounts,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
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

final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "binary": AccountTypeEnum.binary,
  "mt5": AccountTypeEnum.mt5,
};

/// account_type Enum
enum AccountTypeEnum {
  binary,
  mt5,
}
/// Accounts item model class
abstract class AccountsItemModel {
  /// Initializes
  AccountsItemModel({
    @required this.accountType,
    @required this.balance,
    @required this.currency,
    @required this.loginid,
    @required this.mt5Group,
  });

  /// Type of the account.
  final AccountTypeEnum accountType;

  /// Account balance.
  final String balance;

  /// Default account currency.
  final String currency;

  /// Client loginid.
  final String loginid;

  /// The group of mt5 account.
  final String mt5Group;
}

/// Accounts item class
class AccountsItem extends AccountsItemModel {
  /// Initializes
  AccountsItem({
    @required AccountTypeEnum accountType,
    @required String balance,
    @required String currency,
    @required String loginid,
    @required String mt5Group,
  }) : super(
          accountType: accountType,
          balance: balance,
          currency: currency,
          loginid: loginid,
          mt5Group: mt5Group,
        );

  /// Creates an instance from JSON
  factory AccountsItem.fromJson(Map<String, dynamic> json) => AccountsItem(
        accountType: accountTypeEnumMapper[json['account_type']],
        balance: json['balance'],
        currency: json['currency'],
        loginid: json['loginid'],
        mt5Group: json['mt5_group'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == accountType, orElse: () => null)
        ?.key;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['loginid'] = loginid;
    resultMap['mt5_group'] = mt5Group;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AccountsItem copyWith({
    AccountTypeEnum accountType,
    String balance,
    String currency,
    String loginid,
    String mt5Group,
  }) =>
      AccountsItem(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        mt5Group: mt5Group ?? this.mt5Group,
      );
}
