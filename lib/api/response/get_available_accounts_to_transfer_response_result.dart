// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Get available accounts to transfer response model class.
abstract class GetAvailableAccountsToTransferResponseModel extends Equatable {
  /// Initializes Get available accounts to transfer response model class .
  const GetAvailableAccountsToTransferResponseModel({
    this.getAvailableAccountsToTransfer,
  });

  /// Returns a list of accounts available to transfer
  final GetAvailableAccountsToTransfer? getAvailableAccountsToTransfer;
}

/// Get available accounts to transfer response class.
class GetAvailableAccountsToTransferResponse
    extends GetAvailableAccountsToTransferResponseModel {
  /// Initializes Get available accounts to transfer response class.
  const GetAvailableAccountsToTransferResponse({
    GetAvailableAccountsToTransfer? getAvailableAccountsToTransfer,
  }) : super(
          getAvailableAccountsToTransfer: getAvailableAccountsToTransfer,
        );

  /// Creates an instance from JSON.
  factory GetAvailableAccountsToTransferResponse.fromJson(
    dynamic getAvailableAccountsToTransferJson,
  ) =>
      GetAvailableAccountsToTransferResponse(
        getAvailableAccountsToTransfer:
            getAvailableAccountsToTransferJson == null
                ? null
                : GetAvailableAccountsToTransfer.fromJson(
                    getAvailableAccountsToTransferJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getAvailableAccountsToTransfer != null) {
      resultMap['get_available_accounts_to_transfer'] =
          getAvailableAccountsToTransfer!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAvailableAccountsToTransferResponse copyWith({
    GetAvailableAccountsToTransfer? getAvailableAccountsToTransfer,
  }) =>
      GetAvailableAccountsToTransferResponse(
        getAvailableAccountsToTransfer: getAvailableAccountsToTransfer ??
            this.getAvailableAccountsToTransfer,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "trading": AccountTypeEnum.trading,
  "wallet": AccountTypeEnum.wallet,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "fiat": TypeEnum.fiat,
  "crypto": TypeEnum.crypto,
  "p2p": TypeEnum.p2p,
  "pa": TypeEnum.pa,
  "pa_client": TypeEnum.paClient,
};

/// Type Enum.
enum TypeEnum {
  /// fiat.
  fiat,

  /// crypto.
  crypto,

  /// p2p.
  p2p,

  /// pa.
  pa,

  /// pa_client.
  paClient,
}
/// Get available accounts to transfer model class.
abstract class GetAvailableAccountsToTransferModel extends Equatable {
  /// Initializes Get available accounts to transfer model class .
  const GetAvailableAccountsToTransferModel({
    required this.accountList,
  });

  /// List of available wallets/trading accounts for transfer.
  final List<AccountListItem> accountList;
}

/// Get available accounts to transfer class.
class GetAvailableAccountsToTransfer
    extends GetAvailableAccountsToTransferModel {
  /// Initializes Get available accounts to transfer class.
  const GetAvailableAccountsToTransfer({
    required List<AccountListItem> accountList,
  }) : super(
          accountList: accountList,
        );

  /// Creates an instance from JSON.
  factory GetAvailableAccountsToTransfer.fromJson(Map<String, dynamic> json) =>
      GetAvailableAccountsToTransfer(
        accountList: List<AccountListItem>.from(
          json['account_list'].map(
            (dynamic item) => AccountListItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_list'] = accountList
        .map<dynamic>(
          (AccountListItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAvailableAccountsToTransfer copyWith({
    List<AccountListItem>? accountList,
  }) =>
      GetAvailableAccountsToTransfer(
        accountList: accountList ?? this.accountList,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Account list item model class.
abstract class AccountListItemModel extends Equatable {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    required this.type,
    required this.loginid,
    required this.currency,
    required this.accountType,
  });

  /// Wallet or trading account type.
  final TypeEnum type;

  /// The loginid of specified account.
  final String loginid;

  /// Currency of specified account.
  final String currency;

  /// Account type.
  final AccountTypeEnum accountType;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    required AccountTypeEnum accountType,
    required String currency,
    required String loginid,
    required TypeEnum type,
  }) : super(
          accountType: accountType,
          currency: currency,
          loginid: loginid,
          type: type,
        );

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountType: accountTypeEnumMapper[json['account_type']]!,
        currency: json['currency'],
        loginid: json['loginid'],
        type: typeEnumMapper[json['type']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['currency'] = currency;
    resultMap['loginid'] = loginid;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountTypeEnum? accountType,
    String? currency,
    String? loginid,
    TypeEnum? type,
  }) =>
      AccountListItem(
        accountType: accountType ?? this.accountType,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        type: type ?? this.type,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
