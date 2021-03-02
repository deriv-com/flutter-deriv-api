import 'package:meta/meta.dart';

import '../../basic_api/generated/mt5_login_list_receive.dart';
import '../../basic_api/generated/mt5_login_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 login list response model class
abstract class Mt5LoginListResponseModel {
  /// Initializes
  Mt5LoginListResponseModel({
    @required this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<Mt5LoginListItem> mt5LoginList;
}

/// Mt5 login list response class
class Mt5LoginListResponse extends Mt5LoginListResponseModel {
  /// Initializes
  Mt5LoginListResponse({
    @required List<Mt5LoginListItem> mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListResponse.fromJson(
    dynamic mt5LoginListJson,
  ) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginListJson == null
            ? null
            : List<Mt5LoginListItem>.from(mt5LoginListJson
                .map((dynamic item) => Mt5LoginListItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5LoginList != null) {
      resultMap['mt5_login_list'] = mt5LoginList
          .map<dynamic>((Mt5LoginListItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of MT5 accounts for client.
  ///
  /// For parameters information refer to [Mt5LoginListRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5LoginListResponse> fetchLoginList(
    Mt5LoginListSend request,
  ) async {
    final Mt5LoginListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5LoginListResponse.fromJson(response.mt5LoginList);
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListResponse copyWith({
    List<Mt5LoginListItem> mt5LoginList,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
}

final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "demo": AccountTypeEnum.demo,
  "real": AccountTypeEnum.real,
};

/// account_type Enum
enum AccountTypeEnum {
  demo,
  real,
}

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

/// landing_company_short Enum
enum LandingCompanyShortEnum {
  bvi,
  labuan,
  malta,
  maltainvest,
  samoa,
  svg,
  vanuatu,
}

final Map<String, MarketTypeEnum> marketTypeEnumMapper =
    <String, MarketTypeEnum>{
  "financial": MarketTypeEnum.financial,
  "gaming": MarketTypeEnum.gaming,
};

/// market_type Enum
enum MarketTypeEnum {
  financial,
  gaming,
}

final Map<String, SubAccountTypeEnum> subAccountTypeEnumMapper =
    <String, SubAccountTypeEnum>{
  "financial": SubAccountTypeEnum.financial,
  "financial_stp": SubAccountTypeEnum.financialStp,
  "swap_free": SubAccountTypeEnum.swapFree,
};

/// sub_account_type Enum
enum SubAccountTypeEnum {
  financial,
  financialStp,
  swapFree,
}
/// Mt5 login list item model class
abstract class Mt5LoginListItemModel {
  /// Initializes
  Mt5LoginListItemModel({
    @required this.subAccountType,
    @required this.server,
    @required this.name,
    @required this.marketType,
    @required this.login,
    @required this.leverage,
    @required this.landingCompanyShort,
    @required this.group,
    @required this.email,
    @required this.displayBalance,
    @required this.currency,
    @required this.country,
    @required this.balance,
    @required this.accountType,
  });

  /// Sub account type
  final SubAccountTypeEnum subAccountType;

  /// Trade server name of the MT5 account.
  final String server;

  /// Name of the owner of the MT5 account.
  final String name;

  /// Market type
  final MarketTypeEnum marketType;

  /// Login of MT5 account.
  final String login;

  /// Leverage of the MT5 account (1 to 1000).
  final double leverage;

  /// Landing company shortcode of the MT5 account.
  final LandingCompanyShortEnum landingCompanyShort;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String group;

  /// Email address of the MT5 account.
  final String email;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Currency of the MT5 account.
  final String currency;

  /// Residence of the MT5 account.
  final String country;

  /// Balance of the MT5 account.
  final double balance;

  /// Account type.
  final AccountTypeEnum accountType;
}

/// Mt5 login list item class
class Mt5LoginListItem extends Mt5LoginListItemModel {
  /// Initializes
  Mt5LoginListItem({
    @required AccountTypeEnum accountType,
    @required double balance,
    @required String country,
    @required String currency,
    @required String displayBalance,
    @required String email,
    @required String group,
    @required LandingCompanyShortEnum landingCompanyShort,
    @required double leverage,
    @required String login,
    @required MarketTypeEnum marketType,
    @required String name,
    @required String server,
    @required SubAccountTypeEnum subAccountType,
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
          subAccountType: subAccountType,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListItem.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListItem(
        accountType: accountTypeEnumMapper[json['account_type']],
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        landingCompanyShort:
            landingCompanyShortEnumMapper[json['landing_company_short']],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        marketType: marketTypeEnumMapper[json['market_type']],
        name: json['name'],
        server: json['server'],
        subAccountType: subAccountTypeEnumMapper[json['sub_account_type']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == accountType, orElse: () => null)
        ?.key;
    resultMap['balance'] = balance;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['email'] = email;
    resultMap['group'] = group;
    resultMap['landing_company_short'] = landingCompanyShortEnumMapper.entries
        .firstWhere((entry) => entry.value == landingCompanyShort,
            orElse: () => null)
        ?.key;
    resultMap['leverage'] = leverage;
    resultMap['login'] = login;
    resultMap['market_type'] = marketTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == marketType, orElse: () => null)
        ?.key;
    resultMap['name'] = name;
    resultMap['server'] = server;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == subAccountType,
            orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListItem copyWith({
    AccountTypeEnum accountType,
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    LandingCompanyShortEnum landingCompanyShort,
    double leverage,
    String login,
    MarketTypeEnum marketType,
    String name,
    String server,
    SubAccountTypeEnum subAccountType,
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
        subAccountType: subAccountType ?? this.subAccountType,
      );
}
