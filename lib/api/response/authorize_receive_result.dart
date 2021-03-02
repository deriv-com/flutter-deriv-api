import 'package:meta/meta.dart';

import '../../basic_api/generated/authorize_receive.dart';
import '../../basic_api/generated/authorize_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Authorize response model class
abstract class AuthorizeResponseModel {
  /// Initializes
  AuthorizeResponseModel({
    @required this.authorize,
  });

  /// Account information for the holder of the token.
  final Authorize authorize;
}

/// Authorize response class
class AuthorizeResponse extends AuthorizeResponseModel {
  /// Initializes
  AuthorizeResponse({
    @required Authorize authorize,
  }) : super(
          authorize: authorize,
        );

  /// Creates an instance from JSON
  factory AuthorizeResponse.fromJson(
    dynamic authorizeJson,
  ) =>
      AuthorizeResponse(
        authorize:
            authorizeJson == null ? null : Authorize.fromJson(authorizeJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (authorize != null) {
      resultMap['authorize'] = authorize.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  ///
  /// For parameters information refer to [AuthorizeRequest].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<AuthorizeResponse> authorizeMethod(
      AuthorizeSend request) async {
    final AuthorizeReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AuthorizeException(baseExceptionModel: baseExceptionModel),
    );

    return AuthorizeResponse.fromJson(response.authorize);
  }

  /// Creates a copy of instance with given parameters
  AuthorizeResponse copyWith({
    Authorize authorize,
  }) =>
      AuthorizeResponse(
        authorize: authorize ?? this.authorize,
      );
}
/// Authorize model class
abstract class AuthorizeModel {
  /// Initializes
  AuthorizeModel({
    @required this.userId,
    @required this.upgradeableLandingCompanies,
    @required this.scopes,
    @required this.loginid,
    @required this.localCurrencies,
    @required this.landingCompanyName,
    @required this.landingCompanyFullname,
    @required this.isVirtual,
    @required this.fullname,
    @required this.email,
    @required this.currency,
    @required this.country,
    @required this.balance,
    @required this.accountList,
  });

  /// The internal user ID for this account.
  final int userId;

  /// List of landing company shortcodes the account can upgrade to.
  final List<dynamic> upgradeableLandingCompanies;

  /// Scopes available to the token.
  final List<String> scopes;

  /// The account ID that the token was issued for.
  final String loginid;

  /// Currencies in client's residence country
  final Map<String, LocalCurrenciesProperty> localCurrencies;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// Landing company name the account belongs to.
  final String landingCompanyFullname;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// User's full name. Will be empty for virtual accounts.
  final String fullname;

  /// User email.
  final String email;

  /// Currency of the account.
  final String currency;

  /// 2-letter country code (ISO standard).
  final String country;

  /// Cash balance of the account.
  final double balance;

  /// List of accounts for current user.
  final List<AccountListItem> accountList;
}

/// Authorize class
class Authorize extends AuthorizeModel {
  /// Initializes
  Authorize({
    @required List<AccountListItem> accountList,
    @required double balance,
    @required String country,
    @required String currency,
    @required String email,
    @required String fullname,
    @required bool isVirtual,
    @required String landingCompanyFullname,
    @required String landingCompanyName,
    @required Map<String, LocalCurrenciesProperty> localCurrencies,
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
            : List<AccountListItem>.from(json['account_list']
                .map((dynamic item) => AccountListItem.fromJson(item))),
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullname: json['fullname'],
        isVirtual: getBool(json['is_virtual']),
        landingCompanyFullname: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        localCurrencies: json['local_currencies'] == null
            ? null
            : Map<String, LocalCurrenciesProperty>.fromEntries(
                json['local_currencies']
                    .entries
                    .map<MapEntry<String, LocalCurrenciesProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, LocalCurrenciesProperty>(
                                entry.key,
                                entry.value == null
                                    ? null
                                    : LocalCurrenciesProperty.fromJson(
                                        entry.value)))),
        loginid: json['loginid'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(json['scopes'].map((dynamic item) => item)),
        upgradeableLandingCompanies:
            json['upgradeable_landing_companies'] == null
                ? null
                : List<dynamic>.from(json['upgradeable_landing_companies']
                    .map((dynamic item) => item)),
        userId: json['user_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (accountList != null) {
      resultMap['account_list'] = accountList
          .map<dynamic>((AccountListItem item) => item.toJson())
          .toList();
    }
    resultMap['balance'] = balance;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['email'] = email;
    resultMap['fullname'] = fullname;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_fullname'] = landingCompanyFullname;
    resultMap['landing_company_name'] = landingCompanyName;
    resultMap['local_currencies'] = localCurrencies;
    resultMap['loginid'] = loginid;
    if (scopes != null) {
      resultMap['scopes'] = scopes.map<dynamic>((String item) => item).toList();
    }
    if (upgradeableLandingCompanies != null) {
      resultMap['upgradeable_landing_companies'] = upgradeableLandingCompanies
          .map<dynamic>((dynamic item) => item)
          .toList();
    }
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Authorize copyWith({
    List<AccountListItem> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullname,
    bool isVirtual,
    String landingCompanyFullname,
    String landingCompanyName,
    Map<String, LocalCurrenciesProperty> localCurrencies,
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
/// Account list item model class
abstract class AccountListItemModel {
  /// Initializes
  AccountListItemModel({
    @required this.loginid,
    @required this.landingCompanyName,
    @required this.isVirtual,
    @required this.isDisabled,
    @required this.excludedUntil,
    @required this.currency,
  });

  /// The account ID of specified account.
  final String loginid;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// Boolean value: 1 or 0, indicating whether the account is a virtual-money account.
  final int isVirtual;

  /// Boolean value: 1 or 0, indicating whether the account is marked as disabled or not.
  final int isDisabled;

  /// Epoch of date till client has excluded him/herself from the website, only present if client is self excluded.
  final DateTime excludedUntil;

  /// Currency of specified account.
  final String currency;
}

/// Account list item class
class AccountListItem extends AccountListItemModel {
  /// Initializes
  AccountListItem({
    @required String currency,
    @required DateTime excludedUntil,
    @required int isDisabled,
    @required int isVirtual,
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
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        currency: json['currency'],
        excludedUntil: getDateTime(json['excluded_until']),
        isDisabled: json['is_disabled'],
        isVirtual: json['is_virtual'],
        landingCompanyName: json['landing_company_name'],
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currency'] = currency;
    resultMap['excluded_until'] = getSecondsSinceEpochDateTime(excludedUntil);
    resultMap['is_disabled'] = isDisabled;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_name'] = landingCompanyName;
    resultMap['loginid'] = loginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AccountListItem copyWith({
    String currency,
    DateTime excludedUntil,
    int isDisabled,
    int isVirtual,
    String landingCompanyName,
    String loginid,
  }) =>
      AccountListItem(
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        loginid: loginid ?? this.loginid,
      );
}
/// Local currencies property model class
abstract class LocalCurrenciesPropertyModel {
  /// Initializes
  LocalCurrenciesPropertyModel({
    @required this.fractionalDigits,
  });

  /// Number of fractional digits.
  final int fractionalDigits;
}

/// Local currencies property class
class LocalCurrenciesProperty extends LocalCurrenciesPropertyModel {
  /// Initializes
  LocalCurrenciesProperty({
    @required int fractionalDigits,
  }) : super(
          fractionalDigits: fractionalDigits,
        );

  /// Creates an instance from JSON
  factory LocalCurrenciesProperty.fromJson(Map<String, dynamic> json) =>
      LocalCurrenciesProperty(
        fractionalDigits: json['fractional_digits'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LocalCurrenciesProperty copyWith({
    int fractionalDigits,
  }) =>
      LocalCurrenciesProperty(
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
      );
}
