/// Mt5 new account receive model class
abstract class Mt5NewAccountReceiveModel {
  /// Initializes
  Mt5NewAccountReceiveModel({
    @required this.mt5NewAccount,
  });

  /// New MT5 account details
  final Mt5NewAccount mt5NewAccount;
}

/// Mt5 new account receive class
class Mt5NewAccountReceive extends Mt5NewAccountReceiveModel {
  /// Initializes
  Mt5NewAccountReceive({
    @required Mt5NewAccount mt5NewAccount,
  }) : super(
          mt5NewAccount: mt5NewAccount,
        );

  /// Creates an instance from JSON
  factory Mt5NewAccountReceive.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountReceive(
        mt5NewAccount: json['mt5_new_account'] == null
            ? null
            : Mt5NewAccount.fromJson(json['mt5_new_account']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (mt5NewAccount != null) {
      result['mt5_new_account'] = mt5NewAccount.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5NewAccountReceive copyWith({
    Mt5NewAccount mt5NewAccount,
  }) =>
      Mt5NewAccountReceive(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
      );
}
/// Mt5 new account model class
abstract class Mt5NewAccountModel {
  /// Initializes
  Mt5NewAccountModel({
    @required this.accountType,
    @required this.balance,
    @required this.currency,
    @required this.displayBalance,
    @required this.login,
    @required this.mt5AccountCategory,
    @required this.mt5AccountType,
  });

  /// Account type.
  final AccountTypeEnum accountType;

  /// Account balance.
  final double balance;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Login ID of the user's new MT5 account. Login could have 2 types of prefixes: MTD, MTR. MTD - for demo accounts and MTR for real money accounts.
  final String login;

  /// With default value of conventional, unavailable for `financial_stp` sub account type.
  final Mt5AccountCategoryEnum mt5AccountCategory;

  /// Sub account type, present only when account type is either `demo` or `financial`.
  final Mt5AccountTypeEnum mt5AccountType;
}

/// Mt5 new account class
class Mt5NewAccount extends Mt5NewAccountModel {
  /// Initializes
  Mt5NewAccount({
    @required String accountType,
    @required double balance,
    @required String currency,
    @required String displayBalance,
    @required String login,
    @required String mt5AccountCategory,
    @required String mt5AccountType,
  }) : super(
          accountType: accountType,
          balance: balance,
          currency: currency,
          displayBalance: displayBalance,
          login: login,
          mt5AccountCategory: mt5AccountCategory,
          mt5AccountType: mt5AccountType,
        );

  /// Creates an instance from JSON
  factory Mt5NewAccount.fromJson(Map<String, dynamic> json) => Mt5NewAccount(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['account_type'],
                    orElse: () => null)
                ?.key,
        balance: getDouble(json['balance']),
        currency: json['currency'],
        displayBalance: json['display_balance'],
        login: json['login'],
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['account_type'] = accountTypeEnumMapper[accountType];
    result['balance'] = balance;
    result['currency'] = currency;
    result['display_balance'] = displayBalance;
    result['login'] = login;
    result['mt5_account_category'] =
        mt5AccountCategoryEnumMapper[mt5AccountCategory];
    result['mt5_account_type'] = mt5AccountTypeEnumMapper[mt5AccountType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5NewAccount copyWith({
    String accountType,
    double balance,
    String currency,
    String displayBalance,
    String login,
    String mt5AccountCategory,
    String mt5AccountType,
  }) =>
      Mt5NewAccount(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        login: login ?? this.login,
        mt5AccountCategory: mt5AccountCategory ?? this.mt5AccountCategory,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
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
