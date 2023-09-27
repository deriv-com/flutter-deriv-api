// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_get_settings_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_get_settings_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 get settings response model class.
abstract class Mt5GetSettingsResponseModel {
  /// Initializes Mt5 get settings response model class .
  const Mt5GetSettingsResponseModel({
    this.mt5GetSettings,
  });

  /// MT5 user account details
  final Mt5GetSettings? mt5GetSettings;
}

/// Mt5 get settings response class.
class Mt5GetSettingsResponse extends Mt5GetSettingsResponseModel {
  /// Initializes Mt5 get settings response class.
  const Mt5GetSettingsResponse({
    super.mt5GetSettings,
  });

  /// Creates an instance from JSON.
  factory Mt5GetSettingsResponse.fromJson(
    dynamic mt5GetSettingsJson,
  ) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettingsJson == null
            ? null
            : Mt5GetSettings.fromJson(mt5GetSettingsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5GetSettings != null) {
      resultMap['mt5_get_settings'] = mt5GetSettings!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets MT5 user account settings.
  ///
  /// For parameters information refer to [Mt5GetSettingsRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<Mt5GetSettingsResponse> fetchSettings(
    Mt5GetSettingsRequest request,
  ) async {
    final Mt5GetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return Mt5GetSettingsResponse.fromJson(response.mt5GetSettings);
  }

  /// Creates a copy of instance with given parameters.
  Mt5GetSettingsResponse copyWith({
    Mt5GetSettings? mt5GetSettings,
  }) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
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
  "seychelles": LandingCompanyShortEnum.seychelles,
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

  /// seychelles.
  seychelles,

  /// svg.
  svg,

  /// vanuatu.
  vanuatu,
}

/// MarketTypeEnum mapper.
final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "all": MarketTypeEnum.all,
  "financial": MarketTypeEnum.financial,
  "synthetic": MarketTypeEnum.synthetic,
};

/// MarketType Enum.
enum MarketTypeEnum {
  /// all.
  all,

  /// financial.
  financial,

  /// synthetic.
  synthetic,
}

/// EnvironmentEnum mapper.
final Map<String, EnvironmentEnum> environmentEnumMapper =
    <String, EnvironmentEnum>{
  "Deriv-Demo": EnvironmentEnum.derivDemo,
  "Deriv-Server": EnvironmentEnum.derivServer,
  "Deriv-Server-02": EnvironmentEnum.derivServer02,
};

/// Environment Enum.
enum EnvironmentEnum {
  /// Deriv-Demo.
  derivDemo,

  /// Deriv-Server.
  derivServer,

  /// Deriv-Server-02.
  derivServer02,
}

/// SubAccountCategoryEnum mapper.
final Map<String, SubAccountCategoryEnum> subAccountCategoryEnumMapper =
    <String, SubAccountCategoryEnum>{
  "none": SubAccountCategoryEnum.none,
  "ibt": SubAccountCategoryEnum.ibt,
  "lim": SubAccountCategoryEnum.lim,
  "stp": SubAccountCategoryEnum.stp,
  "swap_free": SubAccountCategoryEnum.swapFree,
  "swap_free_high_risk": SubAccountCategoryEnum.swapFreeHighRisk,
};

/// SubAccountCategory Enum.
enum SubAccountCategoryEnum {
  /// none.
  none,

  /// ibt.
  ibt,

  /// lim.
  lim,

  /// stp.
  stp,

  /// swap_free.
  swapFree,

  /// swap_free_high_risk.
  swapFreeHighRisk,
}

/// SubAccountTypeEnum mapper.
final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "derivez": SubAccountTypeEnum.derivez,
  "financial": SubAccountTypeEnum.financial,
  "financial_stp": SubAccountTypeEnum.financialStp,
  "standard": SubAccountTypeEnum.standard,
};

/// SubAccountType Enum.
enum SubAccountTypeEnum {
  /// derivez.
  derivez,

  /// financial.
  financial,

  /// financial_stp.
  financialStp,

  /// standard.
  standard,
}
/// Mt5 get settings model class.
abstract class Mt5GetSettingsModel {
  /// Initializes Mt5 get settings model class .
  const Mt5GetSettingsModel({
    this.accountType,
    this.address,
    this.balance,
    this.city,
    this.company,
    this.country,
    this.currency,
    this.displayBalance,
    this.email,
    this.group,
    this.landingCompanyShort,
    this.leverage,
    this.login,
    this.marketType,
    this.name,
    this.phone,
    this.phonePassword,
    this.server,
    this.serverInfo,
    this.state,
    this.subAccountCategory,
    this.subAccountType,
    this.zipCode,
  });

  /// Account type.
  final AccountTypeEnum? accountType;

  /// The address of the user. The maximum length of the address is 128 characters.
  final String? address;

  /// Balance of the Trading account.
  final double? balance;

  /// User's city of residence.
  final String? city;

  /// Name of the client's company. The maximum length of the company name is 64 characters.
  final String? company;

  /// 2-letter country code.
  final String? country;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// Email address.
  final String? email;

  /// The group where account belongs to.
  final String? group;

  /// Landing company shortcode of the MT5 account.
  final LandingCompanyShortEnum? landingCompanyShort;

  /// Client leverage (from 1 to 1000).
  final double? leverage;

  /// Login ID of the user's MT5 account.
  final String? login;

  /// Market type
  final MarketTypeEnum? marketType;

  /// Client's name. The maximum length of a client's symbol name is 128 characters.
  final String? name;

  /// User's phone number.
  final String? phone;

  /// The user's phone password.
  final String? phonePassword;

  /// Trade server name of the MT5 account.
  final String? server;

  /// Trade server information.
  final ServerInfo? serverInfo;

  /// User's state (region) of residence.
  final String? state;

  /// Sub account category.
  final SubAccountCategoryEnum? subAccountCategory;

  /// Sub account type
  final SubAccountTypeEnum? subAccountType;

  /// User's zip code.
  final String? zipCode;
}

/// Mt5 get settings class.
class Mt5GetSettings extends Mt5GetSettingsModel {
  /// Initializes Mt5 get settings class.
  const Mt5GetSettings({
    super.accountType,
    super.address,
    super.balance,
    super.city,
    super.company,
    super.country,
    super.currency,
    super.displayBalance,
    super.email,
    super.group,
    super.landingCompanyShort,
    super.leverage,
    super.login,
    super.marketType,
    super.name,
    super.phone,
    super.phonePassword,
    super.server,
    super.serverInfo,
    super.state,
    super.subAccountCategory,
    super.subAccountType,
    super.zipCode,
  });

  /// Creates an instance from JSON.
  factory Mt5GetSettings.fromJson(Map<String, dynamic> json) => Mt5GetSettings(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        address: json['address'],
        balance: getDouble(json['balance']),
        city: json['city'],
        company: json['company'],
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        landingCompanyShort: json['landing_company_short'] == null
            ? null
            : landingCompanyShortEnumMapper[json['landing_company_short']],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']],
        name: json['name'],
        phone: json['phone'],
        phonePassword: json['phonePassword'],
        server: json['server'],
        serverInfo: json['server_info'] == null
            ? null
            : ServerInfo.fromJson(json['server_info']),
        state: json['state'],
        subAccountCategory: json['sub_account_category'] == null
            ? null
            : subAccountCategoryEnumMapper[json['sub_account_category']],
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']],
        zipCode: json['zipCode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['address'] = address;
    resultMap['balance'] = balance;
    resultMap['city'] = city;
    resultMap['company'] = company;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['email'] = email;
    resultMap['group'] = group;
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
    resultMap['phone'] = phone;
    resultMap['phonePassword'] = phonePassword;
    resultMap['server'] = server;
    if (serverInfo != null) {
      resultMap['server_info'] = serverInfo!.toJson();
    }
    resultMap['state'] = state;
    resultMap['sub_account_category'] = subAccountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountCategoryEnum> entry) =>
            entry.value == subAccountCategory)
        .key;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;
    resultMap['zipCode'] = zipCode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5GetSettings copyWith({
    AccountTypeEnum? accountType,
    String? address,
    double? balance,
    String? city,
    String? company,
    String? country,
    String? currency,
    String? displayBalance,
    String? email,
    String? group,
    LandingCompanyShortEnum? landingCompanyShort,
    double? leverage,
    String? login,
    MarketTypeEnum? marketType,
    String? name,
    String? phone,
    String? phonePassword,
    String? server,
    ServerInfo? serverInfo,
    String? state,
    SubAccountCategoryEnum? subAccountCategory,
    SubAccountTypeEnum? subAccountType,
    String? zipCode,
  }) =>
      Mt5GetSettings(
        accountType: accountType ?? this.accountType,
        address: address ?? this.address,
        balance: balance ?? this.balance,
        city: city ?? this.city,
        company: company ?? this.company,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        server: server ?? this.server,
        serverInfo: serverInfo ?? this.serverInfo,
        state: state ?? this.state,
        subAccountCategory: subAccountCategory ?? this.subAccountCategory,
        subAccountType: subAccountType ?? this.subAccountType,
        zipCode: zipCode ?? this.zipCode,
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
