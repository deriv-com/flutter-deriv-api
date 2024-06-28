// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Available accounts response model class.
abstract class AvailableAccountsResponseModel {
  /// Initializes Available accounts response model class .
  const AvailableAccountsResponseModel({
    this.availableAccounts,
  });

  /// Returns list of accounts that are available to be created - limited to wallets and can be extended
  final AvailableAccounts? availableAccounts;
}

/// Available accounts response class.
class AvailableAccountsResponse extends AvailableAccountsResponseModel {
  /// Initializes Available accounts response class.
  const AvailableAccountsResponse({
    super.availableAccounts,
  });

  /// Creates an instance from JSON.
  factory AvailableAccountsResponse.fromJson(
    dynamic availableAccountsJson,
  ) =>
      AvailableAccountsResponse(
        availableAccounts: availableAccountsJson == null
            ? null
            : AvailableAccounts.fromJson(availableAccountsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (availableAccounts != null) {
      resultMap['available_accounts'] = availableAccounts!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AvailableAccountsResponse copyWith({
    AvailableAccounts? availableAccounts,
  }) =>
      AvailableAccountsResponse(
        availableAccounts: availableAccounts ?? this.availableAccounts,
      );
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "doughflow": AccountTypeEnum.doughflow,
  "crypto": AccountTypeEnum.crypto,
  "paymentagent": AccountTypeEnum.paymentagent,
  "paymentagent_client": AccountTypeEnum.paymentagentClient,
  "p2p": AccountTypeEnum.p2p,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// doughflow.
  doughflow,

  /// crypto.
  crypto,

  /// paymentagent.
  paymentagent,

  /// paymentagent_client.
  paymentagentClient,

  /// p2p.
  p2p,
}

/// Available accounts model class.
abstract class AvailableAccountsModel {
  /// Initializes Available accounts model class .
  const AvailableAccountsModel({
    required this.wallets,
  });

  /// Wallet account types that are available to be created
  final List<WalletsItem> wallets;
}

/// Available accounts class.
class AvailableAccounts extends AvailableAccountsModel {
  /// Initializes Available accounts class.
  const AvailableAccounts({
    required super.wallets,
  });

  /// Creates an instance from JSON.
  factory AvailableAccounts.fromJson(Map<String, dynamic> json) =>
      AvailableAccounts(
        wallets: List<WalletsItem>.from(
          json['wallets'].map(
            (dynamic item) => WalletsItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['wallets'] = wallets
        .map<dynamic>(
          (WalletsItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AvailableAccounts copyWith({
    List<WalletsItem>? wallets,
  }) =>
      AvailableAccounts(
        wallets: wallets ?? this.wallets,
      );
}

/// Wallets item model class.
abstract class WalletsItemModel {
  /// Initializes Wallets item model class .
  const WalletsItemModel({
    required this.landingCompany,
    required this.currency,
    required this.accountType,
  });

  /// Landing Company of wallet.
  final String landingCompany;

  /// Currency of wallet
  final String currency;

  /// Account type of wallet
  final AccountTypeEnum accountType;
}

/// Wallets item class.
class WalletsItem extends WalletsItemModel {
  /// Initializes Wallets item class.
  const WalletsItem({
    required super.accountType,
    required super.currency,
    required super.landingCompany,
  });

  /// Creates an instance from JSON.
  factory WalletsItem.fromJson(Map<String, dynamic> json) => WalletsItem(
        accountType: accountTypeEnumMapper[json['account_type']]!,
        currency: json['currency'],
        landingCompany: json['landing_company'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['currency'] = currency;
    resultMap['landing_company'] = landingCompany;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletsItem copyWith({
    AccountTypeEnum? accountType,
    String? currency,
    String? landingCompany,
  }) =>
      WalletsItem(
        accountType: accountType ?? this.accountType,
        currency: currency ?? this.currency,
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
