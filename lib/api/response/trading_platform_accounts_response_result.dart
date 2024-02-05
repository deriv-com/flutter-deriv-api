// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Trading platform accounts response model class.
abstract class TradingPlatformAccountsResponseModel {
  /// Initializes Trading platform accounts response model class .
  const TradingPlatformAccountsResponseModel({
    this.tradingPlatformAccounts,
  });

  /// Array containing Trading account objects.
  final List<TradingPlatformAccountsItem>? tradingPlatformAccounts;
}

/// Trading platform accounts response class.
class TradingPlatformAccountsResponse
    extends TradingPlatformAccountsResponseModel {
  /// Initializes Trading platform accounts response class.
  const TradingPlatformAccountsResponse({
    super.tradingPlatformAccounts,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAccountsResponse.fromJson(
    dynamic tradingPlatformAccountsJson,
  ) =>
      TradingPlatformAccountsResponse(
        tradingPlatformAccounts: tradingPlatformAccountsJson == null
            ? null
            : List<TradingPlatformAccountsItem>.from(
                tradingPlatformAccountsJson?.map(
                  (dynamic item) => TradingPlatformAccountsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingPlatformAccounts != null) {
      resultMap['trading_platform_accounts'] = tradingPlatformAccounts!
          .map<dynamic>(
            (TradingPlatformAccountsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Trading Platform: Accounts List.
  ///
  /// Get list of Trading Platform accounts for client.
  /// For parameters information refer to [TradingPlatformAccountsRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<TradingPlatformAccountsResponse> getAccounts(
    TradingPlatformAccountsRequest request,
  ) async {
    final TradingPlatformAccountsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformAccountsResponse.fromJson(
      response.tradingPlatformAccounts,
    );
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAccountsResponse copyWith({
    List<TradingPlatformAccountsItem>? tradingPlatformAccounts,
  }) =>
      TradingPlatformAccountsResponse(
        tradingPlatformAccounts:
            tradingPlatformAccounts ?? this.tradingPlatformAccounts,
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

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "dxtrade": PlatformEnum.dxtrade,
  "mt5": PlatformEnum.mt5,
  "ctrader": PlatformEnum.ctrader,
};

/// Platform Enum.
enum PlatformEnum {
  /// dxtrade.
  dxtrade,

  /// mt5.
  mt5,

  /// ctrader.
  ctrader,
}

/// EnvironmentEnum mapper.
final Map<String, EnvironmentEnum> environmentEnumMapper =
    <String, EnvironmentEnum>{
  "Deriv-Demo": EnvironmentEnum.derivDemo,
  "Deriv-Server": EnvironmentEnum.derivServer,
  "Deriv-Server-02": EnvironmentEnum.derivServer02,
  "Deriv-Server-03": EnvironmentEnum.derivServer03,
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
/// Trading platform accounts item model class.
abstract class TradingPlatformAccountsItemModel {
  /// Initializes Trading platform accounts item model class .
  const TradingPlatformAccountsItemModel({
    this.accountId,
    this.accountType,
    this.balance,
    this.country,
    this.currency,
    this.displayBalance,
    this.email,
    this.enabled,
    this.group,
    this.landingCompanyShort,
    this.leverage,
    this.login,
    this.marketType,
    this.name,
    this.platform,
    this.server,
    this.serverInfo,
    this.subAccountType,
  });

  /// ID of Trading account.
  final String? accountId;

  /// Account type.
  final AccountTypeEnum? accountType;

  /// Balance of the Trading account.
  final double? balance;

  /// Residence of the MT5 account.
  final String? country;

  /// Currency of the Trading account.
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// Email address of the MT5 account.
  final String? email;

  /// Account enabled status
  final int? enabled;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String? group;

  /// Landing company shortcode of the Trading account.
  final LandingCompanyShortEnum? landingCompanyShort;

  /// Leverage of the MT5 account (1 to 1000).
  final double? leverage;

  /// Login name used to log in into Trading platform
  final String? login;

  /// Market type
  final MarketTypeEnum? marketType;

  /// Name of the owner of the MT5 account.
  final String? name;

  /// Name of trading platform.
  final PlatformEnum? platform;

  /// Trade server name of the MT5 account.
  final String? server;

  /// Trade server information.
  final ServerInfo? serverInfo;

  /// Sub account type
  final SubAccountTypeEnum? subAccountType;
}

/// Trading platform accounts item class.
class TradingPlatformAccountsItem extends TradingPlatformAccountsItemModel {
  /// Initializes Trading platform accounts item class.
  const TradingPlatformAccountsItem({
    super.accountId,
    super.accountType,
    super.balance,
    super.country,
    super.currency,
    super.displayBalance,
    super.email,
    super.enabled,
    super.group,
    super.landingCompanyShort,
    super.leverage,
    super.login,
    super.marketType,
    super.name,
    super.platform,
    super.server,
    super.serverInfo,
    super.subAccountType,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAccountsItem.fromJson(Map<String, dynamic> json) =>
      TradingPlatformAccountsItem(
        accountId: json['account_id'],
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        enabled: json['enabled'],
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
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
        server: json['server'],
        serverInfo: json['server_info'] == null
            ? null
            : ServerInfo.fromJson(json['server_info']),
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
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['email'] = email;
    resultMap['enabled'] = enabled;
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
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;
    resultMap['server'] = server;
    if (serverInfo != null) {
      resultMap['server_info'] = serverInfo!.toJson();
    }
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformAccountsItem copyWith({
    String? accountId,
    AccountTypeEnum? accountType,
    double? balance,
    String? country,
    String? currency,
    String? displayBalance,
    String? email,
    int? enabled,
    String? group,
    LandingCompanyShortEnum? landingCompanyShort,
    double? leverage,
    String? login,
    MarketTypeEnum? marketType,
    String? name,
    PlatformEnum? platform,
    String? server,
    ServerInfo? serverInfo,
    SubAccountTypeEnum? subAccountType,
  }) =>
      TradingPlatformAccountsItem(
        accountId: accountId ?? this.accountId,
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        enabled: enabled ?? this.enabled,
        group: group ?? this.group,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        name: name ?? this.name,
        platform: platform ?? this.platform,
        server: server ?? this.server,
        serverInfo: serverInfo ?? this.serverInfo,
        subAccountType: subAccountType ?? this.subAccountType,
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
