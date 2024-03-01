// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform available accounts response model class.
abstract class TradingPlatformAvailableAccountsResponseModel {
  /// Initializes Trading platform available accounts response model class .
  const TradingPlatformAvailableAccountsResponseModel({
    this.tradingPlatformAvailableAccounts,
  });

  /// Available Trading Accounts
  final List<TradingPlatformAvailableAccountsItem>?
      tradingPlatformAvailableAccounts;
}

/// Trading platform available accounts response class.
class TradingPlatformAvailableAccountsResponse
    extends TradingPlatformAvailableAccountsResponseModel {
  /// Initializes Trading platform available accounts response class.
  const TradingPlatformAvailableAccountsResponse({
    super.tradingPlatformAvailableAccounts,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAvailableAccountsResponse.fromJson(
    dynamic tradingPlatformAvailableAccountsJson,
  ) =>
      TradingPlatformAvailableAccountsResponse(
        tradingPlatformAvailableAccounts:
            tradingPlatformAvailableAccountsJson == null
                ? null
                : List<TradingPlatformAvailableAccountsItem>.from(
                    tradingPlatformAvailableAccountsJson?.map(
                      (dynamic item) =>
                          TradingPlatformAvailableAccountsItem.fromJson(item),
                    ),
                  ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingPlatformAvailableAccounts != null) {
      resultMap['trading_platform_available_accounts'] =
          tradingPlatformAvailableAccounts!
              .map<dynamic>(
                (TradingPlatformAvailableAccountsItem item) => item.toJson(),
              )
              .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAvailableAccountsResponse copyWith({
    List<TradingPlatformAvailableAccountsItem>?
        tradingPlatformAvailableAccounts,
  }) =>
      TradingPlatformAvailableAccountsResponse(
        tradingPlatformAvailableAccounts: tradingPlatformAvailableAccounts ??
            this.tradingPlatformAvailableAccounts,
      );
}

/// LinkableLandingCompaniesItemEnum mapper.
final Map<String, LinkableLandingCompaniesItemEnum>
    linkableLandingCompaniesItemEnumMapper =
    <String, LinkableLandingCompaniesItemEnum>{
  "svg": LinkableLandingCompaniesItemEnum.svg,
  "maltainvest": LinkableLandingCompaniesItemEnum.maltainvest,
};

/// LinkableLandingCompaniesItem Enum.
enum LinkableLandingCompaniesItemEnum {
  /// svg.
  svg,

  /// maltainvest.
  maltainvest,
}

/// MarketTypeEnum mapper.
final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "financial": MarketTypeEnum.financial,
  "synthetic": MarketTypeEnum.synthetic,
  "gaming": MarketTypeEnum.gaming,
  "all": MarketTypeEnum.all,
};

/// MarketType Enum.
enum MarketTypeEnum {
  /// financial.
  financial,

  /// synthetic.
  synthetic,

  /// gaming.
  gaming,

  /// all.
  all,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "standard": SubAccountTypeEnum.standard,
  "swap_free": SubAccountTypeEnum.swapFree,
  "stp": SubAccountTypeEnum.stp,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// standard.
  standard,

  /// swap_free.
  swapFree,

  /// stp.
  stp,
}
/// Trading platform available accounts item model class.
abstract class TradingPlatformAvailableAccountsItemModel {
  /// Initializes Trading platform available accounts item model class .
  const TradingPlatformAvailableAccountsItemModel({
    this.linkableLandingCompanies,
    this.marketType,
    this.name,
    this.requirements,
    this.shortcode,
    this.subAccountType,
  });

  /// A list of Deriv landing companies that can work with this account type
  final List<LinkableLandingCompaniesItemEnum>? linkableLandingCompanies;

  /// The type of market tradable by this account
  final MarketTypeEnum? marketType;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final Requirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Sub account type
  final SubAccountTypeEnum? subAccountType;
}

/// Trading platform available accounts item class.
class TradingPlatformAvailableAccountsItem
    extends TradingPlatformAvailableAccountsItemModel {
  /// Initializes Trading platform available accounts item class.
  const TradingPlatformAvailableAccountsItem({
    super.linkableLandingCompanies,
    super.marketType,
    super.name,
    super.requirements,
    super.shortcode,
    super.subAccountType,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAvailableAccountsItem.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAvailableAccountsItem(
        linkableLandingCompanies: json['linkable_landing_companies'] == null
            ? null
            : List<LinkableLandingCompaniesItemEnum>.from(
                json['linkable_landing_companies']?.map(
                  (dynamic item) => item == null
                      ? null
                      : linkableLandingCompaniesItemEnumMapper[item],
                ),
              ),
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']],
        name: json['name'],
        requirements: json['requirements'] == null
            ? null
            : Requirements.fromJson(json['requirements']),
        shortcode: json['shortcode'],
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (linkableLandingCompanies != null) {
      resultMap['linkable_landing_companies'] = linkableLandingCompanies!
          .map<dynamic>(
            (LinkableLandingCompaniesItemEnum item) =>
                linkableLandingCompaniesItemEnumMapper.entries
                    .firstWhere(
                        (MapEntry<String, LinkableLandingCompaniesItemEnum>
                                entry) =>
                            entry.value == item)
                    .key,
          )
          .toList();
    }
    resultMap['market_type'] = marketTypeEnumMapper.entries
        .firstWhere((MapEntry<String, MarketTypeEnum> entry) =>
            entry.value == marketType)
        .key;
    resultMap['name'] = name;
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAvailableAccountsItem copyWith({
    List<LinkableLandingCompaniesItemEnum>? linkableLandingCompanies,
    MarketTypeEnum? marketType,
    String? name,
    Requirements? requirements,
    String? shortcode,
    SubAccountTypeEnum? subAccountType,
  }) =>
      TradingPlatformAvailableAccountsItem(
        linkableLandingCompanies:
            linkableLandingCompanies ?? this.linkableLandingCompanies,
        marketType: marketType ?? this.marketType,
        name: name ?? this.name,
        requirements: requirements ?? this.requirements,
        shortcode: shortcode ?? this.shortcode,
        subAccountType: subAccountType ?? this.subAccountType,
      );
}
/// Requirements model class.
abstract class RequirementsModel {
  /// Initializes Requirements model class .
  const RequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final AfterFirstDeposit? afterFirstDeposit;

  /// Compliance requirements
  final Compliance? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Requirements class.
class Requirements extends RequirementsModel {
  /// Initializes Requirements class.
  const Requirements({
    super.afterFirstDeposit,
    super.compliance,
    super.signup,
    super.withdrawal,
  });

  /// Creates an instance from JSON.
  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : AfterFirstDeposit.fromJson(json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : Compliance.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Requirements copyWith({
    AfterFirstDeposit? afterFirstDeposit,
    Compliance? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      Requirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// After first deposit model class.
abstract class AfterFirstDepositModel {
  /// Initializes After first deposit model class .
  const AfterFirstDepositModel({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// After first deposit class.
class AfterFirstDeposit extends AfterFirstDepositModel {
  /// Initializes After first deposit class.
  const AfterFirstDeposit({
    super.financialAssessment,
  });

  /// Creates an instance from JSON.
  factory AfterFirstDeposit.fromJson(Map<String, dynamic> json) =>
      AfterFirstDeposit(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AfterFirstDeposit copyWith({
    List<String>? financialAssessment,
  }) =>
      AfterFirstDeposit(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Compliance model class.
abstract class ComplianceModel {
  /// Initializes Compliance model class .
  const ComplianceModel({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Compliance class.
class Compliance extends ComplianceModel {
  /// Initializes Compliance class.
  const Compliance({
    super.mt5,
    super.taxInformation,
  });

  /// Creates an instance from JSON.
  factory Compliance.fromJson(Map<String, dynamic> json) => Compliance(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Compliance copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      Compliance(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
