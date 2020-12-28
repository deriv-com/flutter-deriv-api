/// Mt5 new account send model class
abstract class Mt5NewAccountSendModel {
  /// Initializes
  Mt5NewAccountSendModel({
    @required this.mt5NewAccount,
    @required this.accountType,
    this.address,
    this.city,
    this.company,
    this.country,
    this.currency,
    this.dryRun,
    @required this.email,
    this.investPassword,
    @required this.leverage,
    @required this.mainPassword,
    this.mt5AccountCategory,
    this.mt5AccountType,
    @required this.name,
    this.phone,
    this.phonePassword,
    this.state,
    this.zipCode,
  });

  /// Must be `1`
  final int mt5NewAccount;

  /// Account type. If set to 'financial', setting 'mt5_account_type' is also required.
  final AccountTypeEnum accountType;

  /// [Optional] The address of the user. The maximum length of this address field is 128 characters.
  final String address;

  /// [Optional] User's city of residence.
  final String city;

  /// [Optional] Name of the client's company. The maximum length of the company name is 64 characters.
  final String company;

  /// [Optional] 2-letter country code (value received from `residence_list` call).
  final String country;

  /// [Optional] MT5 account currency, the default value will be the qualified account currency.
  final String currency;

  /// [Optional] If set to `true`, only validation is performed.
  final bool dryRun;

  /// Email address
  final String email;

  /// [Optional] The investor password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String investPassword;

  /// Client leverage (from 1 to 1000).
  final double leverage;

  /// The master password of the account. For validation (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address). This field is required.
  final String mainPassword;

  /// [Optional] To choose whether account is conventional or swap_free. Unavailable for financial_stp MT5_account_type
  final Mt5AccountCategoryEnum mt5AccountCategory;

  /// [Optional] Financial: Variable spreads, High leverage. Financial STP: Variable spreads, Medium Leverage, more products. If 'account_type' set to 'financial', setting 'mt5_account_type' is also required.
  final Mt5AccountTypeEnum mt5AccountType;

  /// Client's name. The maximum length here is 101 characters.
  final String name;

  /// [Optional] User's phone number.
  final String phone;

  /// [Optional] The user's phone password.
  final String phonePassword;

  /// [Optional] User's state (region) of residence.
  final String state;

  /// [Optional] User's zip code.
  final String zipCode;
}

/// Mt5 new account send class
class Mt5NewAccountSend extends Mt5NewAccountSendModel {
  /// Initializes
  Mt5NewAccountSend({
    @required int mt5NewAccount,
    @required String accountType,
    String address,
    String city,
    String company,
    String country,
    String currency,
    bool dryRun,
    @required String email,
    String investPassword,
    @required double leverage,
    @required String mainPassword,
    String mt5AccountCategory,
    String mt5AccountType,
    @required String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
  }) : super(
          mt5NewAccount: mt5NewAccount,
          accountType: accountType,
          address: address,
          city: city,
          company: company,
          country: country,
          currency: currency,
          dryRun: dryRun,
          email: email,
          investPassword: investPassword,
          leverage: leverage,
          mainPassword: mainPassword,
          mt5AccountCategory: mt5AccountCategory,
          mt5AccountType: mt5AccountType,
          name: name,
          phone: phone,
          phonePassword: phonePassword,
          state: state,
          zipCode: zipCode,
        );

  /// Creates an instance from JSON
  factory Mt5NewAccountSend.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountSend(
        mt5NewAccount: json['mt5_new_account'],
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['account_type'],
                    orElse: () => null)
                ?.key,
        address: json['address'],
        city: json['city'],
        company: json['company'],
        country: json['country'],
        currency: json['currency'],
        dryRun: getBool(json['dry_run']),
        email: json['email'],
        investPassword: json['investPassword'],
        leverage: getDouble(json['leverage']),
        mainPassword: json['mainPassword'],
        mt5AccountCategory: json['mt5_account_category'] == null
            ? null
            : mt5AccountCategoryEnumMapper.entries
                .firstWhere(
                    (entry) => entry.value == json['mt5_account_category'],
                    orElse: () => null)
                ?.key,
        mt5AccountType: json['mt5_account_type'] == null
            ? null
            : mt5AccountTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['mt5_account_type'],
                    orElse: () => null)
                ?.key,
        name: json['name'],
        phone: json['phone'],
        phonePassword: json['phonePassword'],
        state: json['state'],
        zipCode: json['zipCode'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_new_account'] = mt5NewAccount;
    result['account_type'] = accountTypeEnumMapper[accountType];
    result['address'] = address;
    result['city'] = city;
    result['company'] = company;
    result['country'] = country;
    result['currency'] = currency;
    result['dry_run'] = dryRun;
    result['email'] = email;
    result['investPassword'] = investPassword;
    result['leverage'] = leverage;
    result['mainPassword'] = mainPassword;
    result['mt5_account_category'] =
        mt5AccountCategoryEnumMapper[mt5AccountCategory];
    result['mt5_account_type'] = mt5AccountTypeEnumMapper[mt5AccountType];
    result['name'] = name;
    result['phone'] = phone;
    result['phonePassword'] = phonePassword;
    result['state'] = state;
    result['zipCode'] = zipCode;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5NewAccountSend copyWith({
    int mt5NewAccount,
    String accountType,
    String address,
    String city,
    String company,
    String country,
    String currency,
    bool dryRun,
    String email,
    String investPassword,
    double leverage,
    String mainPassword,
    String mt5AccountCategory,
    String mt5AccountType,
    String name,
    String phone,
    String phonePassword,
    String state,
    String zipCode,
  }) =>
      Mt5NewAccountSend(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        accountType: accountType ?? this.accountType,
        address: address ?? this.address,
        city: city ?? this.city,
        company: company ?? this.company,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        dryRun: dryRun ?? this.dryRun,
        email: email ?? this.email,
        investPassword: investPassword ?? this.investPassword,
        leverage: leverage ?? this.leverage,
        mainPassword: mainPassword ?? this.mainPassword,
        mt5AccountCategory: mt5AccountCategory ?? this.mt5AccountCategory,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        phonePassword: phonePassword ?? this.phonePassword,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
      );
  // Creating Enum Mappers

  static final Map<AccountTypeEnum, String> accountTypeEnumMapper = {
    AccountTypeEnum.demo: 'demo',
    AccountTypeEnum.gaming: 'gaming',
    AccountTypeEnum.financial: 'financial',
  };

  static final Map<Mt5AccountCategoryEnum, String>
      mt5AccountCategoryEnumMapper = {
    Mt5AccountCategoryEnum.conventional: 'conventional',
    Mt5AccountCategoryEnum.swap_free: 'swap_free',
  };

  static final Map<Mt5AccountTypeEnum, String> mt5AccountTypeEnumMapper = {
    Mt5AccountTypeEnum.financial: 'financial',
    Mt5AccountTypeEnum.financial_stp: 'financial_stp',
  };
}

// Creating Enums

enum AccountTypeEnum {
  demo,
  gaming,
  financial,
}

enum Mt5AccountCategoryEnum {
  conventional,
  swap_free,
}

enum Mt5AccountTypeEnum {
  financial,
  financial_stp,
}
