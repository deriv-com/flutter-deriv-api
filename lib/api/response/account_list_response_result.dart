// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Account list response model class.
abstract class AccountListResponseModel {
  /// Initializes Account list response model class .
  const AccountListResponseModel({
    this.accountList,
  });

  /// List of accounts for current user. This is also available from the `authroize` call.
  final List<AccountListItem>? accountList;
}

/// Account list response class.
class AccountListResponse extends AccountListResponseModel {
  /// Initializes Account list response class.
  const AccountListResponse({
    super.accountList,
  });

  /// Creates an instance from JSON.
  factory AccountListResponse.fromJson(
    dynamic accountListJson,
  ) =>
      AccountListResponse(
        accountList: accountListJson == null
            ? null
            : List<AccountListItem>.from(
                accountListJson?.map(
                  (dynamic item) => AccountListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

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
  AccountListResponse copyWith({
    List<AccountListItem>? accountList,
  }) =>
      AccountListResponse(
        accountList: accountList ?? this.accountList,
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

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "ctrader": PlatformEnum.ctrader,
  "derivez": PlatformEnum.derivez,
  "dtrade": PlatformEnum.dtrade,
  "dwallet": PlatformEnum.dwallet,
  "dxtrade": PlatformEnum.dxtrade,
  "mt5": PlatformEnum.mt5,
};

/// Platform Enum.
enum PlatformEnum {
  /// ctrader.
  ctrader,

  /// derivez.
  derivez,

  /// dtrade.
  dtrade,

  /// dwallet.
  dwallet,

  /// dxtrade.
  dxtrade,

  /// mt5.
  mt5,
}
/// Account list item model class.
abstract class AccountListItemModel {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    required this.loginid,
    required this.linkedTo,
    required this.landingCompanyName,
    required this.isVirtual,
    required this.isDisabled,
    required this.currency,
    required this.createdAt,
    required this.accountType,
    required this.accountCategory,
    this.broker,
  });

  /// The account ID of specified account.
  final String loginid;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<LinkedToItem> linkedTo;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// Boolean value: `true` or `false`, indicating whether the account is marked as disabled or not.
  final bool isDisabled;

  /// Currency of specified account.
  final String currency;

  /// Creation time of the account as epoch.
  final DateTime createdAt;

  /// Account type.
  final String accountType;

  /// Account category.
  final AccountCategoryEnum accountCategory;

  /// 2 letter broker code.
  final String? broker;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    required super.accountCategory,
    required super.accountType,
    required super.createdAt,
    required super.currency,
    required super.isDisabled,
    required super.isVirtual,
    required super.landingCompanyName,
    required super.linkedTo,
    required super.loginid,
    super.broker,
  });

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountCategory: accountCategoryEnumMapper[json['account_category']]!,
        accountType: json['account_type'],
        createdAt: getDateTime(json['created_at'])!,
        currency: json['currency'],
        isDisabled: getBool(json['is_disabled'])!,
        isVirtual: getBool(json['is_virtual'])!,
        landingCompanyName: json['landing_company_name'],
        linkedTo: List<LinkedToItem>.from(
          json['linked_to'].map(
            (dynamic item) => LinkedToItem.fromJson(item),
          ),
        ),
        loginid: json['loginid'],
        broker: json['broker'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = accountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, AccountCategoryEnum> entry) =>
            entry.value == accountCategory)
        .key;
    resultMap['account_type'] = accountType;
    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['currency'] = currency;
    resultMap['is_disabled'] = isDisabled;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_name'] = landingCompanyName;
    resultMap['linked_to'] = linkedTo
        .map<dynamic>(
          (LinkedToItem item) => item.toJson(),
        )
        .toList();

    resultMap['loginid'] = loginid;
    resultMap['broker'] = broker;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountCategoryEnum? accountCategory,
    String? accountType,
    DateTime? createdAt,
    String? currency,
    bool? isDisabled,
    bool? isVirtual,
    String? landingCompanyName,
    List<LinkedToItem>? linkedTo,
    String? loginid,
    String? broker,
  }) =>
      AccountListItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        createdAt: createdAt ?? this.createdAt,
        currency: currency ?? this.currency,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        linkedTo: linkedTo ?? this.linkedTo,
        loginid: loginid ?? this.loginid,
        broker: broker ?? this.broker,
      );
}
/// Linked to item model class.
abstract class LinkedToItemModel {
  /// Initializes Linked to item model class .
  const LinkedToItemModel({
    this.loginid,
    this.platform,
  });

  /// Account ID.
  final String? loginid;

  /// Account platform name.
  final PlatformEnum? platform;
}

/// Linked to item class.
class LinkedToItem extends LinkedToItemModel {
  /// Initializes Linked to item class.
  const LinkedToItem({
    super.loginid,
    super.platform,
  });

  /// Creates an instance from JSON.
  factory LinkedToItem.fromJson(Map<String, dynamic> json) => LinkedToItem(
        loginid: json['loginid'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkedToItem copyWith({
    String? loginid,
    PlatformEnum? platform,
  }) =>
      LinkedToItem(
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
      );
}
