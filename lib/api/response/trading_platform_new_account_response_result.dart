// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform new account response model class.
abstract class TradingPlatformNewAccountResponseModel extends Equatable {
  /// Initializes Trading platform new account response model class .
  const TradingPlatformNewAccountResponseModel({
    this.tradingPlatformNewAccount,
  });

  /// New Trading account details
  final TradingPlatformNewAccount? tradingPlatformNewAccount;
}

/// Trading platform new account response class.
class TradingPlatformNewAccountResponse
    extends TradingPlatformNewAccountResponseModel {
  /// Initializes Trading platform new account response class.
  const TradingPlatformNewAccountResponse({
    TradingPlatformNewAccount? tradingPlatformNewAccount,
  }) : super(
          tradingPlatformNewAccount: tradingPlatformNewAccount,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformNewAccountResponse.fromJson(
    dynamic tradingPlatformNewAccountJson,
  ) =>
      TradingPlatformNewAccountResponse(
        tradingPlatformNewAccount: tradingPlatformNewAccountJson == null
            ? null
            : TradingPlatformNewAccount.fromJson(tradingPlatformNewAccountJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingPlatformNewAccount != null) {
      resultMap['trading_platform_new_account'] =
          tradingPlatformNewAccount!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformNewAccountResponse copyWith({
    TradingPlatformNewAccount? tradingPlatformNewAccount,
  }) =>
      TradingPlatformNewAccountResponse(
        tradingPlatformNewAccount:
            tradingPlatformNewAccount ?? this.tradingPlatformNewAccount,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "demo": AccountTypeEnum.demo,
  "real": AccountTypeEnum.real,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// demo.
  demo,

  /// real.
  real,
}

/// LandingCompanyShortEnum mapper.
final Map<String, LandingCompanyShortEnum> landingCompanyShortEnumMapper =
    <String, LandingCompanyShortEnum>{
  "bvi": LandingCompanyShortEnum.bvi,
  "labuan": LandingCompanyShortEnum.labuan,
  "malta": LandingCompanyShortEnum.malta,
  "maltainvest": LandingCompanyShortEnum.maltainvest,
  "samoa": LandingCompanyShortEnum.samoa,
  "svg": LandingCompanyShortEnum.svg,
  "vanuatu": LandingCompanyShortEnum.vanuatu,
};

/// LandingCompanyShort Enum.
enum LandingCompanyShortEnum {
  /// bvi.
  bvi,

  /// labuan.
  labuan,

  /// malta.
  malta,

  /// maltainvest.
  maltainvest,

  /// samoa.
  samoa,

  /// svg.
  svg,

  /// vanuatu.
  vanuatu,
}

/// MarketTypeEnum mapper.
final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "financial": MarketTypeEnum.financial,
  "synthetic": MarketTypeEnum.synthetic,
};

/// MarketType Enum.
enum MarketTypeEnum {
  /// financial.
  financial,

  /// synthetic.
  synthetic,
}

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "dxtrade": PlatformEnum.dxtrade,
};

/// Platform Enum.
enum PlatformEnum {
  /// dxtrade.
  dxtrade,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "financial": SubAccountTypeEnum.financial,
  "financial_stp": SubAccountTypeEnum.financialStp,
  "swap_free": SubAccountTypeEnum.swapFree,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// financial.
  financial,

  /// financial_stp.
  financialStp,

  /// swap_free.
  swapFree,
}
/// Trading platform new account model class.
abstract class TradingPlatformNewAccountModel extends Equatable {
  /// Initializes Trading platform new account model class .
  const TradingPlatformNewAccountModel({
    this.accountId,
    this.accountType,
    this.balance,
    this.currency,
    this.displayBalance,
    this.landingCompanyShort,
    this.login,
    this.marketType,
    this.platform,
    this.subAccountType,
  });

  /// ID of Trading account.
  final String? accountId;

  /// Account type.
  final AccountTypeEnum? accountType;

  /// Balance of the Trading account.
  final double? balance;

  /// Currency of the Trading account.
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// Landing company shortcode of the Trading account.
  final LandingCompanyShortEnum? landingCompanyShort;

  /// Login name used to log in into Trading platform.
  final String? login;

  /// Market type.
  final MarketTypeEnum? marketType;

  /// Name of trading platform.
  final PlatformEnum? platform;

  /// Sub account type.
  final SubAccountTypeEnum? subAccountType;
}

/// Trading platform new account class.
class TradingPlatformNewAccount extends TradingPlatformNewAccountModel {
  /// Initializes Trading platform new account class.
  const TradingPlatformNewAccount({
    String? accountId,
    AccountTypeEnum? accountType,
    double? balance,
    String? currency,
    String? displayBalance,
    LandingCompanyShortEnum? landingCompanyShort,
    String? login,
    MarketTypeEnum? marketType,
    PlatformEnum? platform,
    SubAccountTypeEnum? subAccountType,
  }) : super(
          accountId: accountId,
          accountType: accountType,
          balance: balance,
          currency: currency,
          displayBalance: displayBalance,
          landingCompanyShort: landingCompanyShort,
          login: login,
          marketType: marketType,
          platform: platform,
          subAccountType: subAccountType,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformNewAccount.fromJson(Map<String, dynamic> json) =>
      TradingPlatformNewAccount(
        accountId: json['account_id'],
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        balance: getDouble(json['balance']),
        currency: json['currency'],
        displayBalance: json['display_balance'],
        landingCompanyShort: json['landing_company_short'] == null
            ? null
            : landingCompanyShortEnumMapper[json['landing_company_short']],
        login: json['login'],
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['landing_company_short'] = landingCompanyShortEnumMapper.entries
        .firstWhere((MapEntry<String, LandingCompanyShortEnum> entry) =>
            entry.value == landingCompanyShort)
        .key;
    resultMap['login'] = login;
    resultMap['market_type'] = marketTypeEnumMapper.entries
        .firstWhere((MapEntry<String, MarketTypeEnum> entry) =>
            entry.value == marketType)
        .key;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformNewAccount copyWith({
    String? accountId,
    AccountTypeEnum? accountType,
    double? balance,
    String? currency,
    String? displayBalance,
    LandingCompanyShortEnum? landingCompanyShort,
    String? login,
    MarketTypeEnum? marketType,
    PlatformEnum? platform,
    SubAccountTypeEnum? subAccountType,
  }) =>
      TradingPlatformNewAccount(
        accountId: accountId ?? this.accountId,
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        platform: platform ?? this.platform,
        subAccountType: subAccountType ?? this.subAccountType,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
