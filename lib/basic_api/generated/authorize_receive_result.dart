/// Authorize receive model class
abstract class AuthorizeReceiveModel {
  /// Initializes
  AuthorizeReceiveModel({
    @required this.authorize,
  });

  /// Account information for the holder of the token.
  final Authorize authorize;
}

/// Authorize receive class
class AuthorizeReceive extends AuthorizeReceiveModel {
  /// Initializes
  AuthorizeReceive({
    @required Authorize authorize,
  }) : super(
          authorize: authorize,
        );

  /// Creates an instance from JSON
  factory AuthorizeReceive.fromJson(Map<String, dynamic> json) =>
      AuthorizeReceive(
        authorize: json['authorize'] == null
            ? null
            : Authorize.fromJson(json['authorize']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (authorize != null) {
      result['authorize'] = authorize.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AuthorizeReceive copyWith({
    Authorize authorize,
  }) =>
      AuthorizeReceive(
        authorize: authorize ?? this.authorize,
      );
}
/// Authorize model class
abstract class AuthorizeModel {
  /// Initializes
  AuthorizeModel({
    @required this.accountList,
    @required this.balance,
    @required this.country,
    @required this.currency,
    @required this.email,
    @required this.fullname,
    @required this.isVirtual,
    @required this.landingCompanyFullname,
    @required this.landingCompanyName,
    @required this.localCurrencies,
    @required this.loginid,
    @required this.scopes,
    @required this.upgradeableLandingCompanies,
    @required this.userId,
  });

  /// List of accounts for current user.
  final List<AccountList> accountList;

  /// Cash balance of the account.
  final double balance;

  /// 2-letter country code (ISO standard).
  final String country;

  /// Currency of the account.
  final String currency;

  /// User email.
  final String email;

  /// User's full name. Will be empty for virtual accounts.
  final String fullname;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// Landing company name the account belongs to.
  final String landingCompanyFullname;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// Currencies in client's residence country
  final Map<String, dynamic> localCurrencies;

  /// The account ID that the token was issued for.
  final String loginid;

  /// Scopes available to the token.
  final List<String> scopes;

  /// List of landing company shortcodes the account can upgrade to.
  final List<dynamic> upgradeableLandingCompanies;

  /// The internal user ID for this account.
  final int userId;
}

/// Authorize class
class Authorize extends AuthorizeModel {
  /// Initializes
  Authorize({
    @required List<AccountList> accountList,
    @required double balance,
    @required String country,
    @required String currency,
    @required String email,
    @required String fullname,
    @required bool isVirtual,
    @required String landingCompanyFullname,
    @required String landingCompanyName,
    @required Map<String, dynamic> localCurrencies,
    @required String loginid,
    @required List<String> scopes,
    @required List<dynamic> upgradeableLandingCompanies,
    @required int userId,
  }) : super(
          accountList: accountList,
          balance: balance,
          country: country,
          currency: currency,
          email: email,
          fullname: fullname,
          isVirtual: isVirtual,
          landingCompanyFullname: landingCompanyFullname,
          landingCompanyName: landingCompanyName,
          localCurrencies: localCurrencies,
          loginid: loginid,
          scopes: scopes,
          upgradeableLandingCompanies: upgradeableLandingCompanies,
          userId: userId,
        );

  /// Creates an instance from JSON
  factory Authorize.fromJson(Map<String, dynamic> json) => Authorize(
        accountList: json['account_list'] == null
            ? null
            : json['account_list']
                .map<AccountList>((dynamic item) => AccountList.fromJson(item))
                .toList(),
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullname: json['fullname'],
        isVirtual: getBool(json['is_virtual']),
        landingCompanyFullname: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        localCurrencies: json['local_currencies'],
        loginid: json['loginid'],
        scopes: List<String>.from(json['scopes'].map((x) => x)),
        userId: json['user_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (accountList != null) {
      result['account_list'] =
          accountList.map((item) => item.toJson()).toList();
    }
    result['balance'] = balance;
    result['country'] = country;
    result['currency'] = currency;
    result['email'] = email;
    result['fullname'] = fullname;
    result['is_virtual'] = isVirtual;
    result['landing_company_fullname'] = landingCompanyFullname;
    result['landing_company_name'] = landingCompanyName;
    result['local_currencies'] = localCurrencies;
    result['loginid'] = loginid;
    result['scopes'] = scopes;
    result['upgradeable_landing_companies'] = upgradeableLandingCompanies;
    result['user_id'] = userId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Authorize copyWith({
    List<AccountList> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullname,
    bool isVirtual,
    String landingCompanyFullname,
    String landingCompanyName,
    Map<String, dynamic> localCurrencies,
    String loginid,
    List<String> scopes,
    List<dynamic> upgradeableLandingCompanies,
    int userId,
  }) =>
      Authorize(
        accountList: accountList ?? this.accountList,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        fullname: fullname ?? this.fullname,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyFullname:
            landingCompanyFullname ?? this.landingCompanyFullname,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        loginid: loginid ?? this.loginid,
        scopes: scopes ?? this.scopes,
        upgradeableLandingCompanies:
            upgradeableLandingCompanies ?? this.upgradeableLandingCompanies,
        userId: userId ?? this.userId,
      );
}
/// Account list model class
abstract class AccountListModel {
  /// Initializes
  AccountListModel({
    @required this.currency,
    @required this.excludedUntil,
    @required this.isDisabled,
    @required this.isVirtual,
    @required this.landingCompanyName,
    @required this.loginid,
  });

  /// Currency of specified account.
  final String currency;

  /// Epoch of date till client has excluded him/herself from the website, only present if client is self excluded.
  final int excludedUntil;

  /// Boolean value: `true` or `false`, indicating whether the account is marked as disabled or not.
  final bool isDisabled;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// The account ID of specified account.
  final String loginid;
}

/// Account list class
class AccountList extends AccountListModel {
  /// Initializes
  AccountList({
    @required String currency,
    @required int excludedUntil,
    @required bool isDisabled,
    @required bool isVirtual,
    @required String landingCompanyName,
    @required String loginid,
  }) : super(
          currency: currency,
          excludedUntil: excludedUntil,
          isDisabled: isDisabled,
          isVirtual: isVirtual,
          landingCompanyName: landingCompanyName,
          loginid: loginid,
        );

  /// Creates an instance from JSON
  factory AccountList.fromJson(Map<String, dynamic> json) => AccountList(
        currency: json['currency'],
        excludedUntil: json['excluded_until'],
        isDisabled: getBool(json['is_disabled']),
        isVirtual: getBool(json['is_virtual']),
        landingCompanyName: json['landing_company_name'],
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['currency'] = currency;
    result['excluded_until'] = excludedUntil;
    result['is_disabled'] = isDisabled;
    result['is_virtual'] = isVirtual;
    result['landing_company_name'] = landingCompanyName;
    result['loginid'] = loginid;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AccountList copyWith({
    String currency,
    int excludedUntil,
    bool isDisabled,
    bool isVirtual,
    String landingCompanyName,
    String loginid,
  }) =>
      AccountList(
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        loginid: loginid ?? this.loginid,
      );
}
