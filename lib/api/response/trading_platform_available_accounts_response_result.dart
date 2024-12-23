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

/// PoaStatusEnum mapper.
final Map<String, PoaStatusEnum> poaStatusEnumMapper = <String, PoaStatusEnum>{
  "none": PoaStatusEnum.none,
  "pending": PoaStatusEnum.pending,
  "expired": PoaStatusEnum.expired,
  "verified": PoaStatusEnum.verified,
  "rejected": PoaStatusEnum.rejected,
};

/// PoaStatus Enum.
enum PoaStatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// expired.
  expired,

  /// verified.
  verified,

  /// rejected.
  rejected,
}

/// PoiStatusEnum mapper.
final Map<String, PoiStatusEnum> poiStatusEnumMapper = <String, PoiStatusEnum>{
  "none": PoiStatusEnum.none,
  "pending": PoiStatusEnum.pending,
  "verified": PoiStatusEnum.verified,
  "suspected": PoiStatusEnum.suspected,
  "rejected": PoiStatusEnum.rejected,
  "expired": PoiStatusEnum.expired,
};

/// PoiStatus Enum.
enum PoiStatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// verified.
  verified,

  /// suspected.
  suspected,

  /// rejected.
  rejected,

  /// expired.
  expired,
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

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "mt5": PlatformEnum.mt5,
  "dxtrade": PlatformEnum.dxtrade,
  "ctrader": PlatformEnum.ctrader,
};

/// Platform Enum.
enum PlatformEnum {
  /// mt5.
  mt5,

  /// dxtrade.
  dxtrade,

  /// ctrader.
  ctrader,
}

/// ProductEnum mapper.
final Map<String, ProductEnum> productEnumMapper = <String, ProductEnum>{
  "synthetic": ProductEnum.synthetic,
  "financial": ProductEnum.financial,
  "swap_free": ProductEnum.swapFree,
  "zero_spread": ProductEnum.zeroSpread,
  "standard": ProductEnum.standard,
  "stp": ProductEnum.stp,
  "gold": ProductEnum.gold,
};

/// Product Enum.
enum ProductEnum {
  /// synthetic.
  synthetic,

  /// financial.
  financial,

  /// swap_free.
  swapFree,

  /// zero_spread.
  zeroSpread,

  /// standard.
  standard,

  /// stp.
  stp,

  /// gold.
  gold,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "standard": SubAccountTypeEnum.standard,
  "stp": SubAccountTypeEnum.stp,
  "ibt": SubAccountTypeEnum.ibt,
  "swap_free": SubAccountTypeEnum.swapFree,
  "zero_spread": SubAccountTypeEnum.zeroSpread,
  "gold": SubAccountTypeEnum.gold,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// standard.
  standard,

  /// stp.
  stp,

  /// ibt.
  ibt,

  /// swap_free.
  swapFree,

  /// zero_spread.
  zeroSpread,

  /// gold.
  gold,
}
/// Trading platform available accounts item model class.
abstract class TradingPlatformAvailableAccountsItemModel {
  /// Initializes Trading platform available accounts item model class .
  const TradingPlatformAvailableAccountsItemModel({
    this.availableCount,
    this.clientKycStatus,
    this.instruments,
    this.isDefaultJurisdiction,
    this.jurisdiction,
    this.licenceNumber,
    this.linkableLandingCompanies,
    this.marketType,
    this.maxCount,
    this.name,
    this.platform,
    this.product,
    this.productDetails,
    this.regulatoryAuthority,
    this.requirements,
    this.shortcode,
    this.subAccountType,
  });

  /// The remaining number of accounts that can be created
  final int? availableCount;

  /// [Optional] Pertains to client KYC. Returned only if the client fails to meet the requirements, including proof of identity (POI), validity of the tax identification number (TIN), and proof of address (POA).
  final ClientKycStatus? clientKycStatus;

  /// The list of instruments that can be traded
  final List<String>? instruments;

  /// Boolean value: true or false, is default jurisdiction refer to default selected jurisdiction based on client data
  final bool? isDefaultJurisdiction;

  /// Jurisdiction of the landing company
  final String? jurisdiction;

  /// Licence number of the landing company
  final String? licenceNumber;

  /// A list of Deriv landing companies that can work with this account type
  final List<LinkableLandingCompaniesItemEnum>? linkableLandingCompanies;

  /// The type of market tradable by this account
  final MarketTypeEnum? marketType;

  /// The maximum number of accounts that can be created
  final int? maxCount;

  /// Landing Company legal name
  final String? name;

  /// The trading platform for this account
  final PlatformEnum? platform;

  /// Product name that Deriv offer
  final ProductEnum? product;

  /// Product details
  final ProductDetails? productDetails;

  /// Regulatory authority of the landing company
  final String? regulatoryAuthority;

  /// Legal requirements for the Landing Company
  final Requirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Indicate the different offerings for mt5 account.
  final SubAccountTypeEnum? subAccountType;
}

/// Trading platform available accounts item class.
class TradingPlatformAvailableAccountsItem
    extends TradingPlatformAvailableAccountsItemModel {
  /// Initializes Trading platform available accounts item class.
  const TradingPlatformAvailableAccountsItem({
    super.availableCount,
    super.clientKycStatus,
    super.instruments,
    super.isDefaultJurisdiction,
    super.jurisdiction,
    super.licenceNumber,
    super.linkableLandingCompanies,
    super.marketType,
    super.maxCount,
    super.name,
    super.platform,
    super.product,
    super.productDetails,
    super.regulatoryAuthority,
    super.requirements,
    super.shortcode,
    super.subAccountType,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAvailableAccountsItem.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAvailableAccountsItem(
        availableCount: json['available_count'],
        clientKycStatus: json['client_kyc_status'] == null
            ? null
            : ClientKycStatus.fromJson(json['client_kyc_status']),
        instruments: json['instruments'] == null
            ? null
            : List<String>.from(
                json['instruments']?.map(
                  (dynamic item) => item,
                ),
              ),
        isDefaultJurisdiction: getBool(json['is_default_jurisdiction']),
        jurisdiction: json['jurisdiction'],
        licenceNumber: json['licence_number'],
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
        maxCount: json['max_count'],
        name: json['name'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
        product:
            json['product'] == null ? null : productEnumMapper[json['product']],
        productDetails: json['product_details'] == null
            ? null
            : ProductDetails.fromJson(json['product_details']),
        regulatoryAuthority: json['regulatory_authority'],
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

    resultMap['available_count'] = availableCount;
    if (clientKycStatus != null) {
      resultMap['client_kyc_status'] = clientKycStatus!.toJson();
    }
    if (instruments != null) {
      resultMap['instruments'] = instruments!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['is_default_jurisdiction'] = isDefaultJurisdiction;
    resultMap['jurisdiction'] = jurisdiction;
    resultMap['licence_number'] = licenceNumber;
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
    resultMap['max_count'] = maxCount;
    resultMap['name'] = name;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;
    resultMap['product'] = productEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ProductEnum> entry) => entry.value == product)
        .key;
    if (productDetails != null) {
      resultMap['product_details'] = productDetails!.toJson();
    }
    resultMap['regulatory_authority'] = regulatoryAuthority;
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
    int? availableCount,
    ClientKycStatus? clientKycStatus,
    List<String>? instruments,
    bool? isDefaultJurisdiction,
    String? jurisdiction,
    String? licenceNumber,
    List<LinkableLandingCompaniesItemEnum>? linkableLandingCompanies,
    MarketTypeEnum? marketType,
    int? maxCount,
    String? name,
    PlatformEnum? platform,
    ProductEnum? product,
    ProductDetails? productDetails,
    String? regulatoryAuthority,
    Requirements? requirements,
    String? shortcode,
    SubAccountTypeEnum? subAccountType,
  }) =>
      TradingPlatformAvailableAccountsItem(
        availableCount: availableCount ?? this.availableCount,
        clientKycStatus: clientKycStatus ?? this.clientKycStatus,
        instruments: instruments ?? this.instruments,
        isDefaultJurisdiction:
            isDefaultJurisdiction ?? this.isDefaultJurisdiction,
        jurisdiction: jurisdiction ?? this.jurisdiction,
        licenceNumber: licenceNumber ?? this.licenceNumber,
        linkableLandingCompanies:
            linkableLandingCompanies ?? this.linkableLandingCompanies,
        marketType: marketType ?? this.marketType,
        maxCount: maxCount ?? this.maxCount,
        name: name ?? this.name,
        platform: platform ?? this.platform,
        product: product ?? this.product,
        productDetails: productDetails ?? this.productDetails,
        regulatoryAuthority: regulatoryAuthority ?? this.regulatoryAuthority,
        requirements: requirements ?? this.requirements,
        shortcode: shortcode ?? this.shortcode,
        subAccountType: subAccountType ?? this.subAccountType,
      );
}
/// Client kyc status model class.
abstract class ClientKycStatusModel {
  /// Initializes Client kyc status model class .
  const ClientKycStatusModel({
    this.poaStatus,
    this.poiStatus,
    this.validTin,
  });

  /// Status of proof of address (POA).
  final PoaStatusEnum? poaStatus;

  /// Status of proof of identity (POI).
  final PoiStatusEnum? poiStatus;

  /// Indicates whether the tax identification number (TIN) is valid (1) or not (0).
  final bool? validTin;
}

/// Client kyc status class.
class ClientKycStatus extends ClientKycStatusModel {
  /// Initializes Client kyc status class.
  const ClientKycStatus({
    super.poaStatus,
    super.poiStatus,
    super.validTin,
  });

  /// Creates an instance from JSON.
  factory ClientKycStatus.fromJson(Map<String, dynamic> json) =>
      ClientKycStatus(
        poaStatus: json['poa_status'] == null
            ? null
            : poaStatusEnumMapper[json['poa_status']],
        poiStatus: json['poi_status'] == null
            ? null
            : poiStatusEnumMapper[json['poi_status']],
        validTin: getBool(json['valid_tin']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['poa_status'] = poaStatusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PoaStatusEnum> entry) => entry.value == poaStatus)
        .key;
    resultMap['poi_status'] = poiStatusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PoiStatusEnum> entry) => entry.value == poiStatus)
        .key;
    resultMap['valid_tin'] = validTin;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ClientKycStatus copyWith({
    PoaStatusEnum? poaStatus,
    PoiStatusEnum? poiStatus,
    bool? validTin,
  }) =>
      ClientKycStatus(
        poaStatus: poaStatus ?? this.poaStatus,
        poiStatus: poiStatus ?? this.poiStatus,
        validTin: validTin ?? this.validTin,
      );
}
/// Product details model class.
abstract class ProductDetailsModel {
  /// Initializes Product details model class .
  const ProductDetailsModel({
    this.maxLeverage,
    this.minSpread,
  });

  /// Max leverage for the product
  final String? maxLeverage;

  /// Min spread for the product
  final String? minSpread;
}

/// Product details class.
class ProductDetails extends ProductDetailsModel {
  /// Initializes Product details class.
  const ProductDetails({
    super.maxLeverage,
    super.minSpread,
  });

  /// Creates an instance from JSON.
  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        maxLeverage: json['max_leverage'],
        minSpread: json['min_spread'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_leverage'] = maxLeverage;
    resultMap['min_spread'] = minSpread;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ProductDetails copyWith({
    String? maxLeverage,
    String? minSpread,
  }) =>
      ProductDetails(
        maxLeverage: maxLeverage ?? this.maxLeverage,
        minSpread: minSpread ?? this.minSpread,
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
