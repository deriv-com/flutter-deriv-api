// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Trading platform new account response model class.
abstract class TradingPlatformNewAccountResponseModel {
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
    super.tradingPlatformNewAccount,
  });

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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Trading Platform: New Account (request).
  ///
  /// This call creates new Trading account, either demo or real money.
  /// For parameters information refer to [TradingPlatformNewAccountRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<TradingPlatformNewAccountResponse> create(
    TradingPlatformNewAccountRequest request,
  ) async {
    final TradingPlatformNewAccountReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformNewAccountResponse.fromJson(
      response.tradingPlatformNewAccount,
    );
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformNewAccountResponse copyWith({
    TradingPlatformNewAccount? tradingPlatformNewAccount,
  }) =>
      TradingPlatformNewAccountResponse(
        tradingPlatformNewAccount:
            tradingPlatformNewAccount ?? this.tradingPlatformNewAccount,
      );
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "demo": AccountTypeEnum.demo,
  "real": AccountTypeEnum.real,
  "all": AccountTypeEnum.all,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// demo.
  demo,

  /// real.
  real,

  /// all.
  all,
}

/// LandingCompanyShortEnum mapper.
final Map<String, LandingCompanyShortEnum> landingCompanyShortEnumMapper =
    <String, LandingCompanyShortEnum>{
  "bvi": LandingCompanyShortEnum.bvi,
  "labuan": LandingCompanyShortEnum.labuan,
  "malta": LandingCompanyShortEnum.malta,
  "maltainvest": LandingCompanyShortEnum.maltainvest,
  "svg": LandingCompanyShortEnum.svg,
  "vanuatu": LandingCompanyShortEnum.vanuatu,
  "seychelles": LandingCompanyShortEnum.seychelles,
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

  /// svg.
  svg,

  /// vanuatu.
  vanuatu,

  /// seychelles.
  seychelles,
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

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "dxtrade": PlatformEnum.dxtrade,
  "derivez": PlatformEnum.derivez,
  "ctrader": PlatformEnum.ctrader,
};

/// Platform Enum.
enum PlatformEnum {
  /// dxtrade.
  dxtrade,

  /// derivez.
  derivez,

  /// ctrader.
  ctrader,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "financial": SubAccountTypeEnum.financial,
  "financial_stp": SubAccountTypeEnum.financialStp,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// financial.
  financial,

  /// financial_stp.
  financialStp,
}
/// Trading platform new account model class.
abstract class TradingPlatformNewAccountModel {
  /// Initializes Trading platform new account model class .
  const TradingPlatformNewAccountModel({
    this.accountId,
    this.accountType,
    this.agent,
    this.balance,
    this.currency,
    this.displayBalance,
    this.enabled,
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

  /// Agent Details.
  final String? agent;

  /// Balance of the Trading account.
  final double? balance;

  /// Currency of the Trading account.
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// Account enabled status
  final int? enabled;

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
    super.accountId,
    super.accountType,
    super.agent,
    super.balance,
    super.currency,
    super.displayBalance,
    super.enabled,
    super.landingCompanyShort,
    super.login,
    super.marketType,
    super.platform,
    super.subAccountType,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformNewAccount.fromJson(Map<String, dynamic> json) =>
      TradingPlatformNewAccount(
        accountId: json['account_id'],
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        agent: json['agent'],
        balance: getDouble(json['balance']),
        currency: json['currency'],
        displayBalance: json['display_balance'],
        enabled: json['enabled'],
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
    resultMap['agent'] = agent;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['enabled'] = enabled;
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
    String? agent,
    double? balance,
    String? currency,
    String? displayBalance,
    int? enabled,
    LandingCompanyShortEnum? landingCompanyShort,
    String? login,
    MarketTypeEnum? marketType,
    PlatformEnum? platform,
    SubAccountTypeEnum? subAccountType,
  }) =>
      TradingPlatformNewAccount(
        accountId: accountId ?? this.accountId,
        accountType: accountType ?? this.accountType,
        agent: agent ?? this.agent,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        enabled: enabled ?? this.enabled,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        platform: platform ?? this.platform,
        subAccountType: subAccountType ?? this.subAccountType,
      );
}
