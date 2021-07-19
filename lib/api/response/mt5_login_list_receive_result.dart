// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_login_list_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_login_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Mt5 login list response model class.
abstract class Mt5LoginListResponseModel {
  /// Initializes Mt5 login list response model class .
  Mt5LoginListResponseModel({
    this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<Mt5LoginListItem>? mt5LoginList;
}

/// Mt5 login list response class.
class Mt5LoginListResponse extends Mt5LoginListResponseModel {
  /// Initializes Mt5 login list response class.
  Mt5LoginListResponse({
    List<Mt5LoginListItem>? mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the list of MT5 accounts for client.
  ///
  /// For parameters information refer to [Mt5LoginListRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5LoginListResponse> fetchLoginList(
    Mt5LoginListRequest request,
  ) async {
    final Mt5LoginListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
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
/// Mt5 login list item model class.
abstract class Mt5LoginListItemModel {
  /// Initializes Mt5 login list item model class .
  Mt5LoginListItemModel({
    this.accountType,
    this.balance,
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
    this.server,
    this.serverInfo,
    this.subAccountType,
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

  /// Email address of the MT5 account.
  final String? email;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String? group;

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

  /// Trade server name of the MT5 account.
  final String? server;

  /// Trade server information.
  final ServerInfo? serverInfo;

  /// Sub account type
  final SubAccountTypeEnum? subAccountType;
}

/// Mt5 login list item class.
class Mt5LoginListItem extends Mt5LoginListItemModel {
  /// Initializes Mt5 login list item class.
  Mt5LoginListItem({
    AccountTypeEnum? accountType,
    double? balance,
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
    String? server,
    ServerInfo? serverInfo,
    SubAccountTypeEnum? subAccountType,
  }) : super(
          accountType: accountType,
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          landingCompanyShort: landingCompanyShort,
          leverage: leverage,
          login: login,
          marketType: marketType,
          name: name,
          server: server,
          serverInfo: serverInfo,
          subAccountType: subAccountType,
        );

  /// Creates an instance from JSON.
  factory Mt5LoginListItem.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListItem(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']]!,
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        landingCompanyShort: json['landing_company_short'] == null
            ? null
            : landingCompanyShortEnumMapper[json['landing_company_short']]!,
        leverage: getDouble(json['leverage']),
        login: json['login'],
        marketType: json['market_type'] == null
            ? null
            : marketTypeEnumMapper[json['market_type']]!,
        name: json['name'],
        server: json['server'],
        serverInfo: json['server_info'] == null
            ? null
            : ServerInfo.fromJson(json['server_info']),
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']]!,
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
  Mt5LoginListItem copyWith({
    AccountTypeEnum? accountType,
    double? balance,
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
    String? server,
    ServerInfo? serverInfo,
    SubAccountTypeEnum? subAccountType,
  }) =>
      Mt5LoginListItem(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
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
        server: server ?? this.server,
        serverInfo: serverInfo ?? this.serverInfo,
        subAccountType: subAccountType ?? this.subAccountType,
      );
}
/// Server info model class.
abstract class ServerInfoModel {
  /// Initializes Server info model class .
  ServerInfoModel({
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
  ServerInfo({
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    String? id,
  }) : super(
          environment: environment,
          geolocation: geolocation,
          id: id,
        );

  /// Creates an instance from JSON.
  factory ServerInfo.fromJson(Map<String, dynamic> json) => ServerInfo(
        environment: json['environment'] == null
            ? null
            : environmentEnumMapper[json['environment']]!,
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
  GeolocationModel({
    this.location,
    this.region,
    this.sequence,
  });

  /// Sever location.
  final String? location;

  /// Sever region.
  final String? region;

  /// Sever sequence.
  final int? sequence;
}

/// Geolocation class.
class Geolocation extends GeolocationModel {
  /// Initializes Geolocation class.
  Geolocation({
    String? location,
    String? region,
    int? sequence,
  }) : super(
          location: location,
          region: region,
          sequence: sequence,
        );

  /// Creates an instance from JSON.
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        location: json['location'],
        region: json['region'],
        sequence: json['sequence'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['location'] = location;
    resultMap['region'] = region;
    resultMap['sequence'] = sequence;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Geolocation copyWith({
    String? location,
    String? region,
    int? sequence,
  }) =>
      Geolocation(
        location: location ?? this.location,
        region: region ?? this.region,
        sequence: sequence ?? this.sequence,
      );
}
