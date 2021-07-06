import '../../basic_api/generated/mt5_get_settings_receive.dart';
import '../../basic_api/generated/mt5_get_settings_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 get settings response model class
abstract class Mt5GetSettingsResponseModel {
  /// Initializes
  Mt5GetSettingsResponseModel({
    this.mt5GetSettings,
  });

  /// MT5 user account details
  final Mt5GetSettings? mt5GetSettings;
}

/// Mt5 get settings response class
class Mt5GetSettingsResponse extends Mt5GetSettingsResponseModel {
  /// Initializes
  Mt5GetSettingsResponse({
    Mt5GetSettings? mt5GetSettings,
  }) : super(
          mt5GetSettings: mt5GetSettings,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettingsResponse.fromJson(
    dynamic mt5GetSettingsJson,
  ) =>
      Mt5GetSettingsResponse(
        mt5GetSettings: mt5GetSettingsJson == null
            ? null
            : Mt5GetSettings.fromJson(mt5GetSettingsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5GetSettings != null) {
      resultMap['mt5_get_settings'] = mt5GetSettings!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets MT5 user account settings.
  ///
  /// For parameters information refer to [Mt5GetSettingsRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5GetSettingsResponse> fetchSettings(
    Mt5GetSettingsSend request,
  ) async {
    final Mt5GetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5GetSettingsResponse.fromJson(response.mt5GetSettings);
  }

  /// Creates a copy of instance with given parameters
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
/// Mt5 get settings model class
abstract class Mt5GetSettingsModel {
  /// Initializes
  Mt5GetSettingsModel({
    this.accountType,
    this.address,
    this.balance,
    this.city,
    this.company,
    this.country,
    this.currency,
    this.email,
    this.group,
    this.landingCompanyShort,
    this.leverage,
    this.login,
    this.marketType,
    this.name,
    this.phone,
    this.phonePassword,
    this.state,
    this.subAccountType,
    this.zipCode,
  });

  /// Account type.
  final AccountTypeEnum? accountType;

  /// The address of the user. The maximum length of the address is 128 characters.
  final String? address;

  /// Account balance.
  final String? balance;

  /// User's city of residence.
  final String? city;

  /// Name of the client's company. The maximum length of the company name is 64 characters.
  final String? company;

  /// 2-letter country code.
  final String? country;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String? currency;

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

  /// User's state (region) of residence.
  final String? state;

  /// Sub account type
  final SubAccountTypeEnum? subAccountType;

  /// User's zip code.
  final String? zipCode;
}

/// Mt5 get settings class
class Mt5GetSettings extends Mt5GetSettingsModel {
  /// Initializes
  Mt5GetSettings({
    AccountTypeEnum? accountType,
    String? address,
    String? balance,
    String? city,
    String? company,
    String? country,
    String? currency,
    String? email,
    String? group,
    LandingCompanyShortEnum? landingCompanyShort,
    double? leverage,
    String? login,
    MarketTypeEnum? marketType,
    String? name,
    String? phone,
    String? phonePassword,
    String? state,
    SubAccountTypeEnum? subAccountType,
    String? zipCode,
  }) : super(
          accountType: accountType,
          address: address,
          balance: balance,
          city: city,
          company: company,
          country: country,
          currency: currency,
          email: email,
          group: group,
          landingCompanyShort: landingCompanyShort,
          leverage: leverage,
          login: login,
          marketType: marketType,
          name: name,
          phone: phone,
          phonePassword: phonePassword,
          state: state,
          subAccountType: subAccountType,
          zipCode: zipCode,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettings.fromJson(Map<String, dynamic> json) => Mt5GetSettings(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']]!,
        address: json['address'],
        balance: json['balance'],
        city: json['city'],
        company: json['company'],
        country: json['country'],
        currency: json['currency'],
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
        phone: json['phone'],
        phonePassword: json['phonePassword'],
        state: json['state'],
        subAccountType: json['sub_account_type'] == null
            ? null
            : subAccountTypeEnumMapper[json['sub_account_type']]!,
        zipCode: json['zipCode'],
      );

  /// Converts an instance to JSON
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
    resultMap['state'] = state;
    resultMap['sub_account_type'] = subAccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, SubAccountTypeEnum> entry) =>
            entry.value == subAccountType)
        .key;
    resultMap['zipCode'] = zipCode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Mt5GetSettings copyWith({
    AccountTypeEnum? accountType,
    String? address,
    String? balance,
    String? city,
    String? company,
    String? country,
    String? currency,
    String? email,
    String? group,
    LandingCompanyShortEnum? landingCompanyShort,
    double? leverage,
    String? login,
    MarketTypeEnum? marketType,
    String? name,
    String? phone,
    String? phonePassword,
    String? state,
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
        email: email ?? this.email,
        group: group ?? this.group,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        marketType: marketType ?? this.marketType,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        state: state ?? this.state,
        subAccountType: subAccountType ?? this.subAccountType,
        zipCode: zipCode ?? this.zipCode,
      );
}
