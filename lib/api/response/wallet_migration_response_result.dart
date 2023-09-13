// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Wallet migration response model class.
abstract class WalletMigrationResponseModel {
  /// Initializes Wallet migration response model class .
  const WalletMigrationResponseModel({
    this.walletMigration,
  });

  /// The information regarding wallet migration state
  final WalletMigration? walletMigration;
}

/// Wallet migration response class.
class WalletMigrationResponse extends WalletMigrationResponseModel {
  /// Initializes Wallet migration response class.
  const WalletMigrationResponse({
    super.walletMigration,
  });

  /// Creates an instance from JSON.
  factory WalletMigrationResponse.fromJson(
    dynamic walletMigrationJson,
  ) =>
      WalletMigrationResponse(
        walletMigration: walletMigrationJson == null
            ? null
            : WalletMigration.fromJson(walletMigrationJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (walletMigration != null) {
      resultMap['wallet_migration'] = walletMigration!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletMigrationResponse copyWith({
    WalletMigration? walletMigration,
  }) =>
      WalletMigrationResponse(
        walletMigration: walletMigration ?? this.walletMigration,
      );
}

/// AccountCategoryEnum mapper.
final Map<String, AccountCategoryEnum> accountCategoryEnumMapper =
    <String, AccountCategoryEnum>{
  "wallet": AccountCategoryEnum.wallet,
};

/// AccountCategory Enum.
enum AccountCategoryEnum {
  /// wallet.
  wallet,
}

/// LinkAccountsItemAccountCategoryEnum mapper.
final Map<String, LinkAccountsItemAccountCategoryEnum>
    linkAccountsItemAccountCategoryEnumMapper =
    <String, LinkAccountsItemAccountCategoryEnum>{
  "trading": LinkAccountsItemAccountCategoryEnum.trading,
};

/// AccountCategory Enum.
enum LinkAccountsItemAccountCategoryEnum {
  /// trading.
  trading,
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "standard": AccountTypeEnum.standard,
  "mt5": AccountTypeEnum.mt5,
  "dxtrade": AccountTypeEnum.dxtrade,
  "derivez": AccountTypeEnum.derivez,
  "ctrader": AccountTypeEnum.ctrader,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// standard.
  standard,

  /// mt5.
  mt5,

  /// dxtrade.
  dxtrade,

  /// derivez.
  derivez,

  /// ctrader.
  ctrader,
}

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "dtrade": PlatformEnum.dtrade,
  "mt5": PlatformEnum.mt5,
  "dxtrade": PlatformEnum.dxtrade,
  "derivez": PlatformEnum.derivez,
  "ctrader": PlatformEnum.ctrader,
};

/// Platform Enum.
enum PlatformEnum {
  /// dtrade.
  dtrade,

  /// mt5.
  mt5,

  /// dxtrade.
  dxtrade,

  /// derivez.
  derivez,

  /// ctrader.
  ctrader,
}

/// AccountListItemPlatformEnum mapper.
final Map<String, AccountListItemPlatformEnum>
    accountListItemPlatformEnumMapper = <String, AccountListItemPlatformEnum>{
  "dwallet": AccountListItemPlatformEnum.dwallet,
};

/// Platform Enum.
enum AccountListItemPlatformEnum {
  /// dwallet.
  dwallet,
}

/// StateEnum mapper.
final Map<String, StateEnum> stateEnumMapper = <String, StateEnum>{
  "ineligible": StateEnum.ineligible,
  "eligible": StateEnum.eligible,
  "in_progress": StateEnum.inProgress,
  "migrated": StateEnum.migrated,
  "failed": StateEnum.failed,
};

/// State Enum.
enum StateEnum {
  /// ineligible.
  ineligible,

  /// eligible.
  eligible,

  /// in_progress.
  inProgress,

  /// migrated.
  migrated,

  /// failed.
  failed,
}
/// Wallet migration model class.
abstract class WalletMigrationModel {
  /// Initializes Wallet migration model class .
  const WalletMigrationModel({
    required this.state,
    this.accountList,
  });

  /// Current state of migration process
  final StateEnum state;

  /// [Optional] This field is only presented when state is eligible. It contains a list of accounts that are eligible for migration and provide information what wallets are going to be created
  final List<AccountListItem>? accountList;
}

/// Wallet migration class.
class WalletMigration extends WalletMigrationModel {
  /// Initializes Wallet migration class.
  const WalletMigration({
    required super.state,
    super.accountList,
  });

  /// Creates an instance from JSON.
  factory WalletMigration.fromJson(Map<String, dynamic> json) =>
      WalletMigration(
        state: stateEnumMapper[json['state']]!,
        accountList: json['account_list'] == null
            ? null
            : List<AccountListItem>.from(
                json['account_list']?.map(
                  (dynamic item) => AccountListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['state'] = stateEnumMapper.entries
        .firstWhere((MapEntry<String, StateEnum> entry) => entry.value == state)
        .key;
    if (accountList != null) {
      resultMap['account_list'] = accountList!
          .map<dynamic>(
            (AccountListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletMigration copyWith({
    StateEnum? state,
    List<AccountListItem>? accountList,
  }) =>
      WalletMigration(
        state: state ?? this.state,
        accountList: accountList ?? this.accountList,
      );
}
/// Account list item model class.
abstract class AccountListItemModel {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    required this.platform,
    required this.linkAccounts,
    required this.landingCompanyShort,
    required this.currency,
    required this.accountType,
    required this.accountCategory,
  });

  /// The platform of the account
  final AccountListItemPlatformEnum platform;

  /// The list of accounts that will be linked to this wallet account
  final List<LinkAccountsItem> linkAccounts;

  /// The landing company short code of the account
  final String landingCompanyShort;

  /// The currency of the account
  final String currency;

  /// The type of the account
  final String accountType;

  /// The category of the account
  final AccountCategoryEnum accountCategory;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    required super.accountCategory,
    required super.accountType,
    required super.currency,
    required super.landingCompanyShort,
    required super.linkAccounts,
    required super.platform,
  });

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountCategory: accountCategoryEnumMapper[json['account_category']]!,
        accountType: json['account_type'],
        currency: json['currency'],
        landingCompanyShort: json['landing_company_short'],
        linkAccounts: List<LinkAccountsItem>.from(
          json['link_accounts'].map(
            (dynamic item) => LinkAccountsItem.fromJson(item),
          ),
        ),
        platform: accountListItemPlatformEnumMapper[json['platform']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = accountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, AccountCategoryEnum> entry) =>
            entry.value == accountCategory)
        .key;
    resultMap['account_type'] = accountType;
    resultMap['currency'] = currency;
    resultMap['landing_company_short'] = landingCompanyShort;
    resultMap['link_accounts'] = linkAccounts
        .map<dynamic>(
          (LinkAccountsItem item) => item.toJson(),
        )
        .toList();

    resultMap['platform'] = accountListItemPlatformEnumMapper.entries
        .firstWhere((MapEntry<String, AccountListItemPlatformEnum> entry) =>
            entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountCategoryEnum? accountCategory,
    String? accountType,
    String? currency,
    String? landingCompanyShort,
    List<LinkAccountsItem>? linkAccounts,
    AccountListItemPlatformEnum? platform,
  }) =>
      AccountListItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        currency: currency ?? this.currency,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        linkAccounts: linkAccounts ?? this.linkAccounts,
        platform: platform ?? this.platform,
      );
}
/// Link accounts item model class.
abstract class LinkAccountsItemModel {
  /// Initializes Link accounts item model class .
  const LinkAccountsItemModel({
    required this.platform,
    required this.loginid,
    required this.accountType,
    required this.accountCategory,
  });

  /// The platform of the account
  final PlatformEnum platform;

  /// The loginid of the account
  final String loginid;

  /// The type of the account
  final AccountTypeEnum accountType;

  /// The category of the account
  final LinkAccountsItemAccountCategoryEnum accountCategory;
}

/// Link accounts item class.
class LinkAccountsItem extends LinkAccountsItemModel {
  /// Initializes Link accounts item class.
  const LinkAccountsItem({
    required super.accountCategory,
    required super.accountType,
    required super.loginid,
    required super.platform,
  });

  /// Creates an instance from JSON.
  factory LinkAccountsItem.fromJson(Map<String, dynamic> json) =>
      LinkAccountsItem(
        accountCategory: linkAccountsItemAccountCategoryEnumMapper[
            json['account_category']]!,
        accountType: accountTypeEnumMapper[json['account_type']]!,
        loginid: json['loginid'],
        platform: platformEnumMapper[json['platform']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = linkAccountsItemAccountCategoryEnumMapper
        .entries
        .firstWhere(
            (MapEntry<String, LinkAccountsItemAccountCategoryEnum> entry) =>
                entry.value == accountCategory)
        .key;
    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['loginid'] = loginid;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkAccountsItem copyWith({
    LinkAccountsItemAccountCategoryEnum? accountCategory,
    AccountTypeEnum? accountType,
    String? loginid,
    PlatformEnum? platform,
  }) =>
      LinkAccountsItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
      );
}
