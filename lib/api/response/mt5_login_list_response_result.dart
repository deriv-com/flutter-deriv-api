// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_login_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_login_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 login list response model class.
abstract class Mt5LoginListResponseModel {
  /// Initializes Mt5 login list response model class .
  const Mt5LoginListResponseModel({
    this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<Mt5LoginListItem>? mt5LoginList;
}

/// Mt5 login list response class.
class Mt5LoginListResponse extends Mt5LoginListResponseModel {
  /// Initializes Mt5 login list response class.
  const Mt5LoginListResponse({
    super.mt5LoginList,
  });

  /// Creates an instance from JSON.
  factory Mt5LoginListResponse.fromJson(
    dynamic mt5LoginListJson,
  ) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginListJson == null
            ? null
            : List<Mt5LoginListItem>.from(
                mt5LoginListJson?.map(
                  (dynamic item) => Mt5LoginListItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5LoginList != null) {
      resultMap['mt5_login_list'] = mt5LoginList!
          .map<dynamic>(
            (Mt5LoginListItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the list of MT5 accounts for client.
  ///
  /// For parameters information refer to [Mt5LoginListRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<Mt5LoginListResponse> fetchLoginList(
    Mt5LoginListRequest request,
  ) async {
    final Mt5LoginListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return Mt5LoginListResponse.fromJson(response.mt5LoginList);
  }

  /// Creates a copy of instance with given parameters.
  Mt5LoginListResponse copyWith({
    List<Mt5LoginListItem>? mt5LoginList,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
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

/// ProductEnum mapper.
final Map<String, ProductEnum> productEnumMapper = <String, ProductEnum>{
  "synthetic": ProductEnum.synthetic,
  "financial": ProductEnum.financial,
  "swap_free": ProductEnum.swapFree,
  "zero_spread": ProductEnum.zeroSpread,
  "standard": ProductEnum.standard,
  "stp": ProductEnum.stp,
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
}

/// EnvironmentEnum mapper.
final Map<String, EnvironmentEnum> environmentEnumMapper =
    <String, EnvironmentEnum>{
  "Deriv-Demo": EnvironmentEnum.derivDemo,
  "Deriv-Server": EnvironmentEnum.derivServer,
  "Deriv-Server-02": EnvironmentEnum.derivServer02,
  "Deriv-Server-03": EnvironmentEnum.derivServer03,
  "DerivFX-Server": EnvironmentEnum.derivFXServer,
  "DerivFX-Server-02": EnvironmentEnum.derivFXServer02,
  "DerivFX-Server-03": EnvironmentEnum.derivFXServer03,
  "DerivVU-Server": EnvironmentEnum.derivVUServer,
  "DerivVU-Server-02": EnvironmentEnum.derivVUServer02,
  "DerivVU-Server-03": EnvironmentEnum.derivVUServer03,
  "DerivSVG-Server": EnvironmentEnum.derivSVGServer,
  "DerivSVG-Server-02": EnvironmentEnum.derivSVGServer02,
  "DerivSVG-Server-03": EnvironmentEnum.derivSVGServer03,
  "DerivMT-Server": EnvironmentEnum.derivMTServer,
  "DerivMT-Server-02": EnvironmentEnum.derivMTServer02,
  "DerivMT-Server-03": EnvironmentEnum.derivMTServer03,
  "DerivBVI-Server": EnvironmentEnum.derivBVIServer,
  "DerivBVI-Server-02": EnvironmentEnum.derivBVIServer02,
  "DerivBVI-Server-03": EnvironmentEnum.derivBVIServer03,
};

/// Environment Enum.
enum EnvironmentEnum {
  /// Deriv-Demo.
  derivDemo,

  /// Deriv-Server.
  derivServer,

  /// Deriv-Server-02.
  derivServer02,

  /// Deriv-Server-03.
  derivServer03,

  /// DerivFX-Server.
  derivFXServer,

  /// DerivFX-Server-02.
  derivFXServer02,

  /// DerivFX-Server-03.
  derivFXServer03,

  /// DerivVU-Server.
  derivVUServer,

  /// DerivVU-Server-02.
  derivVUServer02,

  /// DerivVU-Server-03.
  derivVUServer03,

  /// DerivSVG-Server.
  derivSVGServer,

  /// DerivSVG-Server-02.
  derivSVGServer02,

  /// DerivSVG-Server-03.
  derivSVGServer03,

  /// DerivMT-Server.
  derivMTServer,

  /// DerivMT-Server-02.
  derivMTServer02,

  /// DerivMT-Server-03.
  derivMTServer03,

  /// DerivBVI-Server.
  derivBVIServer,

  /// DerivBVI-Server-02.
  derivBVIServer02,

  /// DerivBVI-Server-03.
  derivBVIServer03,
}

/// SubAccountCategoryEnum mapper.
final Map<String, SubAccountCategoryEnum> subAccountCategoryEnumMapper =
    <String, SubAccountCategoryEnum>{
  "swap_free": SubAccountCategoryEnum.swapFree,
  "swap_free_high_risk": SubAccountCategoryEnum.swapFreeHighRisk,
  "lim": SubAccountCategoryEnum.lim,
  "hr": SubAccountCategoryEnum.hr,
  "ab": SubAccountCategoryEnum.ab,
  "ba": SubAccountCategoryEnum.ba,
  "stp": SubAccountCategoryEnum.stp,
};

/// SubAccountCategory Enum.
enum SubAccountCategoryEnum {
  /// swap_free.
  swapFree,

  /// swap_free_high_risk.
  swapFreeHighRisk,

  /// lim.
  lim,

  /// hr.
  hr,

  /// ab.
  ab,

  /// ba.
  ba,

  /// stp.
  stp,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "standard": SubAccountTypeEnum.standard,
  "financial": SubAccountTypeEnum.financial,
  "financial_stp": SubAccountTypeEnum.financialStp,
  "swap_free": SubAccountTypeEnum.swapFree,
  "ibt": SubAccountTypeEnum.ibt,
  "stp": SubAccountTypeEnum.stp,
  "zero_spread": SubAccountTypeEnum.zeroSpread,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// standard.
  standard,

  /// financial.
  financial,

  /// financial_stp.
  financialStp,

  /// swap_free.
  swapFree,

  /// ibt.
  ibt,

  /// stp.
  stp,

  /// zero_spread.
  zeroSpread,
}
/// Mt5 login list item model class.
abstract class Mt5LoginListItemModel {
  /// Initializes Mt5 login list item model class .
  const Mt5LoginListItemModel({
    this.accountType,
    this.balance,
    this.country,
    this.currency,
    this.displayBalance,
    this.eligibleToMigrate,
    this.email,
    this.group,
    this.landingCompany,
    this.landingCompanyShort,
    this.leverage,
    this.login,
    this.marketType,
    this.name,
    this.product,
    this.requestTimestamp,
    this.rights,
    this.server,
    this.serverInfo,
    this.status,
    this.subAccountCategory,
    this.subAccountType,
    this.webtraderUrl,
    this.whiteLabelLinks,
  });

  /// Account type.
  final AccountTypeEnum? accountType;

  /// Balance of the MT5 account.
  final double? balance;

  /// Residence of the MT5 account.
  final String? country;

  /// Currency of the MT5 account.
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// [Optional] Determines the eligibility status for migrating a client account based on verification and account type.
  final Map<String, dynamic>? eligibleToMigrate;

  /// Email address of the MT5 account.
  final String? email;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String? group;

  /// Broker name
  final String? landingCompany;

  /// Landing company shortcode of the MT5 account.
  final LandingCompanyShortEnum? landingCompanyShort;

  /// Leverage of the MT5 account (1 to 1000).
  final double? leverage;

  /// Login of MT5 account.
  final String? login;

  /// Market type
  final MarketTypeEnum? marketType;

  /// Name of the owner of the MT5 account.
  final String? name;

  /// Product name that Deriv offer
  final ProductEnum? product;

  /// Timestamp of the latest MT5 request.
  final DateTime? requestTimestamp;

  /// Rights assigned to the MT5 account.
  final Rights? rights;

  /// Trade server name of the MT5 account.
  final String? server;

  /// Trade server information.
  final ServerInfo? serverInfo;

  /// MT5 account status.
  final String? status;

  /// Sub account category refer to the additional risk management
  final SubAccountCategoryEnum? subAccountCategory;

  /// Sub account type refer to different offerings that we have for mt5
  final SubAccountTypeEnum? subAccountType;

  /// MT5 webtrader url for each mt5 platform
  final String? webtraderUrl;

  /// Links to access MT5 application for different platforms.
  final WhiteLabelLinks? whiteLabelLinks;
}

/// Mt5 login list item class.
class Mt5LoginListItem extends Mt5LoginListItemModel {
  /// Initializes Mt5 login list item class.
  const Mt5LoginListItem({
    super.accountType,
    super.balance,
    super.country,
    super.currency,
    super.displayBalance,
    super.eligibleToMigrate,
    super.email,
    super.group,
    super.landingCompany,
    super.landingCompanyShort,
    super.leverage,
    super.login,
    super.marketType,
    super.name,
    super.product,
    super.requestTimestamp,
    super.rights,
    super.server,
    super.serverInfo,
    super.status,
    super.subAccountCategory,
    super.subAccountType,
    super.webtraderUrl,
    super.whiteLabelLinks,
  });

  /// Creates an instance from JSON.
  factory Mt5LoginListItem.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListItem(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        eligibleToMigrate: json['eligible_to_migrate'],
        email: json['email'],
        group: json['group'],
        landingCompany: json['landing_company'],
        landingCompanyShort: json['landing_company_short'] == null
            ? null
            : landingCompanyShortEnumMapper[json['landing_company_short']],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']],
        name: json['name'],
        product:
            json['product'] == null ? null : productEnumMapper[json['product']],
        requestTimestamp: getDateTime(json['request_timestamp']),
        rights: json['rights'] == null ? null : Rights.fromJson(json['rights']),
        server: json['server'],
        serverInfo: json['server_info'] == null
            ? null
            : ServerInfo.fromJson(json['server_info']),
        status: json['status'],
        subAccountCategory: json['sub_account_category'] == null
            ? null
            : subAccountCategoryEnumMapper[json['sub_account_category']],
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']],
        webtraderUrl: json['webtrader_url'],
        whiteLabelLinks: json['white_label_links'] == null
            ? null
            : WhiteLabelLinks.fromJson(json['white_label_links']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['balance'] = balance;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['eligible_to_migrate'] = eligibleToMigrate;
    resultMap['email'] = email;
    resultMap['group'] = group;
    resultMap['landing_company'] = landingCompany;
    resultMap['landing_company_short'] = landingCompanyShortEnumMapper.entries
        .firstWhere((MapEntry<String, LandingCompanyShortEnum> entry) =>
            entry.value == landingCompanyShort)
        .key;
    resultMap['leverage'] = leverage;
    resultMap['login'] = login;
    resultMap['market_type'] = marketTypeEnumMapper.entries
        .firstWhere((MapEntry<String, MarketTypeEnum> entry) =>
            entry.value == marketType)
        .key;
    resultMap['name'] = name;
    resultMap['product'] = productEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ProductEnum> entry) => entry.value == product)
        .key;
    resultMap['request_timestamp'] =
        getSecondsSinceEpochDateTime(requestTimestamp);
    if (rights != null) {
      resultMap['rights'] = rights!.toJson();
    }
    resultMap['server'] = server;
    if (serverInfo != null) {
      resultMap['server_info'] = serverInfo!.toJson();
    }
    resultMap['status'] = status;
    resultMap['sub_account_category'] = subAccountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountCategoryEnum> entry) =>
            entry.value == subAccountCategory)
        .key;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;
    resultMap['webtrader_url'] = webtraderUrl;
    if (whiteLabelLinks != null) {
      resultMap['white_label_links'] = whiteLabelLinks!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5LoginListItem copyWith({
    AccountTypeEnum? accountType,
    double? balance,
    String? country,
    String? currency,
    String? displayBalance,
    Map<String, dynamic>? eligibleToMigrate,
    String? email,
    String? group,
    String? landingCompany,
    LandingCompanyShortEnum? landingCompanyShort,
    double? leverage,
    String? login,
    MarketTypeEnum? marketType,
    String? name,
    ProductEnum? product,
    DateTime? requestTimestamp,
    Rights? rights,
    String? server,
    ServerInfo? serverInfo,
    String? status,
    SubAccountCategoryEnum? subAccountCategory,
    SubAccountTypeEnum? subAccountType,
    String? webtraderUrl,
    WhiteLabelLinks? whiteLabelLinks,
  }) =>
      Mt5LoginListItem(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        eligibleToMigrate: eligibleToMigrate ?? this.eligibleToMigrate,
        email: email ?? this.email,
        group: group ?? this.group,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        name: name ?? this.name,
        product: product ?? this.product,
        requestTimestamp: requestTimestamp ?? this.requestTimestamp,
        rights: rights ?? this.rights,
        server: server ?? this.server,
        serverInfo: serverInfo ?? this.serverInfo,
        status: status ?? this.status,
        subAccountCategory: subAccountCategory ?? this.subAccountCategory,
        subAccountType: subAccountType ?? this.subAccountType,
        webtraderUrl: webtraderUrl ?? this.webtraderUrl,
        whiteLabelLinks: whiteLabelLinks ?? this.whiteLabelLinks,
      );
}
/// Rights model class.
abstract class RightsModel {
  /// Initializes Rights model class .
  const RightsModel({
    this.api,
    this.apiDeprecated,
    this.confirmed,
    this.enabled,
    this.excludeReports,
    this.expert,
    this.investor,
    this.otpEnabled,
    this.passwordChange,
    this.push,
    this.readonly,
    this.reports,
    this.resetPass,
    this.sponsored,
    this.technical,
    this.tradeDisabled,
    this.trailing,
  });

  /// User is allowed to connect via MT5 Web API
  final bool? api;

  /// This flag is obsolete and not used
  final bool? apiDeprecated;

  /// User's certificate is confirmed
  final bool? confirmed;

  /// The User is allowed to connect
  final bool? enabled;

  /// User is not allowed to view reports
  final bool? excludeReports;

  /// User is allowed to use Expert Advisors
  final bool? expert;

  /// For internal mt5 usage
  final bool? investor;

  /// User is allowed to use OTP
  final bool? otpEnabled;

  /// User is allowed to change password
  final bool? passwordChange;

  /// User has enabled push notifications
  final bool? push;

  /// Value for internal mt5 usage
  final bool? readonly;

  /// User is allowed to receive daily reports
  final bool? reports;

  /// User must change password during next connection
  final bool? resetPass;

  /// VPS is enabled for user
  final bool? sponsored;

  /// User can view technical accounts in manager/admin terminal
  final bool? technical;

  /// Trading is disabled for user
  final bool? tradeDisabled;

  /// User is allowed to use trailing stops
  final bool? trailing;
}

/// Rights class.
class Rights extends RightsModel {
  /// Initializes Rights class.
  const Rights({
    super.api,
    super.apiDeprecated,
    super.confirmed,
    super.enabled,
    super.excludeReports,
    super.expert,
    super.investor,
    super.otpEnabled,
    super.passwordChange,
    super.push,
    super.readonly,
    super.reports,
    super.resetPass,
    super.sponsored,
    super.technical,
    super.tradeDisabled,
    super.trailing,
  });

  /// Creates an instance from JSON.
  factory Rights.fromJson(Map<String, dynamic> json) => Rights(
        api: getBool(json['api']),
        apiDeprecated: getBool(json['api_deprecated']),
        confirmed: getBool(json['confirmed']),
        enabled: getBool(json['enabled']),
        excludeReports: getBool(json['exclude_reports']),
        expert: getBool(json['expert']),
        investor: getBool(json['investor']),
        otpEnabled: getBool(json['otp_enabled']),
        passwordChange: getBool(json['password_change']),
        push: getBool(json['push']),
        readonly: getBool(json['readonly']),
        reports: getBool(json['reports']),
        resetPass: getBool(json['reset_pass']),
        sponsored: getBool(json['sponsored']),
        technical: getBool(json['technical']),
        tradeDisabled: getBool(json['trade_disabled']),
        trailing: getBool(json['trailing']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['api'] = api;
    resultMap['api_deprecated'] = apiDeprecated;
    resultMap['confirmed'] = confirmed;
    resultMap['enabled'] = enabled;
    resultMap['exclude_reports'] = excludeReports;
    resultMap['expert'] = expert;
    resultMap['investor'] = investor;
    resultMap['otp_enabled'] = otpEnabled;
    resultMap['password_change'] = passwordChange;
    resultMap['push'] = push;
    resultMap['readonly'] = readonly;
    resultMap['reports'] = reports;
    resultMap['reset_pass'] = resetPass;
    resultMap['sponsored'] = sponsored;
    resultMap['technical'] = technical;
    resultMap['trade_disabled'] = tradeDisabled;
    resultMap['trailing'] = trailing;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Rights copyWith({
    bool? api,
    bool? apiDeprecated,
    bool? confirmed,
    bool? enabled,
    bool? excludeReports,
    bool? expert,
    bool? investor,
    bool? otpEnabled,
    bool? passwordChange,
    bool? push,
    bool? readonly,
    bool? reports,
    bool? resetPass,
    bool? sponsored,
    bool? technical,
    bool? tradeDisabled,
    bool? trailing,
  }) =>
      Rights(
        api: api ?? this.api,
        apiDeprecated: apiDeprecated ?? this.apiDeprecated,
        confirmed: confirmed ?? this.confirmed,
        enabled: enabled ?? this.enabled,
        excludeReports: excludeReports ?? this.excludeReports,
        expert: expert ?? this.expert,
        investor: investor ?? this.investor,
        otpEnabled: otpEnabled ?? this.otpEnabled,
        passwordChange: passwordChange ?? this.passwordChange,
        push: push ?? this.push,
        readonly: readonly ?? this.readonly,
        reports: reports ?? this.reports,
        resetPass: resetPass ?? this.resetPass,
        sponsored: sponsored ?? this.sponsored,
        technical: technical ?? this.technical,
        tradeDisabled: tradeDisabled ?? this.tradeDisabled,
        trailing: trailing ?? this.trailing,
      );
}
/// Server info model class.
abstract class ServerInfoModel {
  /// Initializes Server info model class .
  const ServerInfoModel({
    this.environment,
    this.geolocation,
    this.id,
  });

  /// The environment. E.g. Deriv-Server.
  final EnvironmentEnum? environment;

  /// Geographical location of the server.
  final Geolocation? geolocation;

  /// Server id.
  final String? id;
}

/// Server info class.
class ServerInfo extends ServerInfoModel {
  /// Initializes Server info class.
  const ServerInfo({
    super.environment,
    super.geolocation,
    super.id,
  });

  /// Creates an instance from JSON.
  factory ServerInfo.fromJson(Map<String, dynamic> json) => ServerInfo(
        environment: json['environment'] == null
            ? null
            : environmentEnumMapper[json['environment']],
        geolocation: json['geolocation'] == null
            ? null
            : Geolocation.fromJson(json['geolocation']),
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['environment'] = environmentEnumMapper.entries
        .firstWhere((MapEntry<String, EnvironmentEnum> entry) =>
            entry.value == environment)
        .key;
    if (geolocation != null) {
      resultMap['geolocation'] = geolocation!.toJson();
    }
    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ServerInfo copyWith({
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    String? id,
  }) =>
      ServerInfo(
        environment: environment ?? this.environment,
        geolocation: geolocation ?? this.geolocation,
        id: id ?? this.id,
      );
}
/// Geolocation model class.
abstract class GeolocationModel {
  /// Initializes Geolocation model class .
  const GeolocationModel({
    this.group,
    this.location,
    this.region,
    this.sequence,
  });

  /// Internal server grouping.
  final String? group;

  /// Server location.
  final String? location;

  /// Server region.
  final String? region;

  /// Server sequence.
  final int? sequence;
}

/// Geolocation class.
class Geolocation extends GeolocationModel {
  /// Initializes Geolocation class.
  const Geolocation({
    super.group,
    super.location,
    super.region,
    super.sequence,
  });

  /// Creates an instance from JSON.
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        group: json['group'],
        location: json['location'],
        region: json['region'],
        sequence: json['sequence'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['group'] = group;
    resultMap['location'] = location;
    resultMap['region'] = region;
    resultMap['sequence'] = sequence;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Geolocation copyWith({
    String? group,
    String? location,
    String? region,
    int? sequence,
  }) =>
      Geolocation(
        group: group ?? this.group,
        location: location ?? this.location,
        region: region ?? this.region,
        sequence: sequence ?? this.sequence,
      );
}
/// White label links model class.
abstract class WhiteLabelLinksModel {
  /// Initializes White label links model class .
  const WhiteLabelLinksModel({
    this.android,
    this.ios,
    this.webtraderUrl,
    this.windows,
  });

  /// Download link for Android.
  final String? android;

  /// Download link for iOS.
  final String? ios;

  /// MT5 webtrader url based on jurisdiction and platform
  final String? webtraderUrl;

  /// Download link for Windows.
  final String? windows;
}

/// White label links class.
class WhiteLabelLinks extends WhiteLabelLinksModel {
  /// Initializes White label links class.
  const WhiteLabelLinks({
    super.android,
    super.ios,
    super.webtraderUrl,
    super.windows,
  });

  /// Creates an instance from JSON.
  factory WhiteLabelLinks.fromJson(Map<String, dynamic> json) =>
      WhiteLabelLinks(
        android: json['android'],
        ios: json['ios'],
        webtraderUrl: json['webtrader_url'],
        windows: json['windows'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['android'] = android;
    resultMap['ios'] = ios;
    resultMap['webtrader_url'] = webtraderUrl;
    resultMap['windows'] = windows;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WhiteLabelLinks copyWith({
    String? android,
    String? ios,
    String? webtraderUrl,
    String? windows,
  }) =>
      WhiteLabelLinks(
        android: android ?? this.android,
        ios: ios ?? this.ios,
        webtraderUrl: webtraderUrl ?? this.webtraderUrl,
        windows: windows ?? this.windows,
      );
}
