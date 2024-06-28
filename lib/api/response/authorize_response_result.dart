// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Authorize response model class.
abstract class AuthorizeResponseModel {
  /// Initializes Authorize response model class .
  const AuthorizeResponseModel({
    this.authorize,
  });

  /// Account information for the holder of the token.
  final Authorize? authorize;
}

/// Authorize response class.
class AuthorizeResponse extends AuthorizeResponseModel {
  /// Initializes Authorize response class.
  const AuthorizeResponse({
    super.authorize,
  });

  /// Creates an instance from JSON.
  factory AuthorizeResponse.fromJson(
    dynamic authorizeJson,
  ) =>
      AuthorizeResponse(
        authorize:
            authorizeJson == null ? null : Authorize.fromJson(authorizeJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (authorize != null) {
      resultMap['authorize'] = authorize!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  ///
  /// For parameters information refer to [AuthorizeRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<AuthorizeReceive> authorizeMethodRaw(
    AuthorizeRequest request,
  ) async {
    final AuthorizeReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  ///
  /// For parameters information refer to [AuthorizeRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<AuthorizeResponse> authorizeMethod(
    AuthorizeRequest request,
  ) async {
    final AuthorizeReceive response = await authorizeMethodRaw(request);

    return AuthorizeResponse.fromJson(response.authorize);
  }

  /// Creates a copy of instance with given parameters.
  AuthorizeResponse copyWith({
    Authorize? authorize,
  }) =>
      AuthorizeResponse(
        authorize: authorize ?? this.authorize,
      );
}

/// AccountCategoryEnum mapper.
final Map<String, AccountCategoryEnum> accountCategoryEnumMapper =
    <String, AccountCategoryEnum>{
  "trading": AccountCategoryEnum.trading,
  "wallet": AccountCategoryEnum.wallet,
};

/// AccountCategory Enum.
enum AccountCategoryEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "ctrader": PlatformEnum.ctrader,
  "derivez": PlatformEnum.derivez,
  "dtrade": PlatformEnum.dtrade,
  "dwallet": PlatformEnum.dwallet,
  "dxtrade": PlatformEnum.dxtrade,
  "mt5": PlatformEnum.mt5,
};

/// Platform Enum.
enum PlatformEnum {
  /// ctrader.
  ctrader,

  /// derivez.
  derivez,

  /// dtrade.
  dtrade,

  /// dwallet.
  dwallet,

  /// dxtrade.
  dxtrade,

  /// mt5.
  mt5,
}

/// Authorize model class.
abstract class AuthorizeModel {
  /// Initializes Authorize model class .
  const AuthorizeModel({
    this.accountList,
    this.balance,
    this.country,
    this.currency,
    this.email,
    this.fullname,
    this.isVirtual,
    this.landingCompanyFullname,
    this.landingCompanyName,
    this.linkedTo,
    this.localCurrencies,
    this.loginid,
    this.preferredLanguage,
    this.scopes,
    this.upgradeableLandingCompanies,
    this.userId,
  });

  /// List of accounts for current user. This is also available from the `account_list` call.
  final List<AccountListItem>? accountList;

  /// Cash balance of the account.
  final double? balance;

  /// 2-letter country code (ISO standard).
  final String? country;

  /// Currency of the account.
  final String? currency;

  /// User email.
  final String? email;

  /// User's full name. Will be empty for virtual accounts.
  final String? fullname;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool? isVirtual;

  /// Landing company name the account belongs to.
  final String? landingCompanyFullname;

  /// Landing company shortcode the account belongs to.
  final String? landingCompanyName;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<AuthorizeLinkedToItem>? linkedTo;

  /// Currencies in client's residence country
  final Map<String, LocalCurrenciesProperty>? localCurrencies;

  /// The account ID that the token was issued for.
  final String? loginid;

  /// User's preferred language, ISO standard code of language
  final String? preferredLanguage;

  /// Scopes available to the token.
  final List<String>? scopes;

  /// List of landing company shortcodes the account can upgrade to.
  final List<dynamic>? upgradeableLandingCompanies;

  /// The internal user ID for this account.
  final int? userId;
}

/// Authorize class.
class Authorize extends AuthorizeModel {
  /// Initializes Authorize class.
  const Authorize({
    super.accountList,
    super.balance,
    super.country,
    super.currency,
    super.email,
    super.fullname,
    super.isVirtual,
    super.landingCompanyFullname,
    super.landingCompanyName,
    super.linkedTo,
    super.localCurrencies,
    super.loginid,
    super.preferredLanguage,
    super.scopes,
    super.upgradeableLandingCompanies,
    super.userId,
  });

  /// Creates an instance from JSON.
  factory Authorize.fromJson(Map<String, dynamic> json) => Authorize(
        accountList: json['account_list'] == null
            ? null
            : List<AccountListItem>.from(
                json['account_list']?.map(
                  (dynamic item) => AccountListItem.fromJson(item),
                ),
              ),
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullname: json['fullname'],
        isVirtual: getBool(json['is_virtual']),
        landingCompanyFullname: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<AuthorizeLinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => AuthorizeLinkedToItem.fromJson(item),
                ),
              ),
        localCurrencies: json['local_currencies'] == null
            ? null
            : Map<String, LocalCurrenciesProperty>.fromEntries(json[
                    'local_currencies']
                .entries
                .map<MapEntry<String, LocalCurrenciesProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, LocalCurrenciesProperty>(entry.key,
                            LocalCurrenciesProperty.fromJson(entry.value)))),
        loginid: json['loginid'],
        preferredLanguage: json['preferred_language'],
        scopes: json['scopes'] == null
            ? null
            : List<String>.from(
                json['scopes']?.map(
                  (dynamic item) => item,
                ),
              ),
        upgradeableLandingCompanies:
            json['upgradeable_landing_companies'] == null
                ? null
                : List<dynamic>.from(
                    json['upgradeable_landing_companies']?.map(
                      (dynamic item) => item,
                    ),
                  ),
        userId: json['user_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (accountList != null) {
      resultMap['account_list'] = accountList!
          .map<dynamic>(
            (AccountListItem item) => item.toJson(),
          )
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
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (AuthorizeLinkedToItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['local_currencies'] = localCurrencies;
    resultMap['loginid'] = loginid;
    resultMap['preferred_language'] = preferredLanguage;
    if (scopes != null) {
      resultMap['scopes'] = scopes!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (upgradeableLandingCompanies != null) {
      resultMap['upgradeable_landing_companies'] = upgradeableLandingCompanies!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['user_id'] = userId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Authorize copyWith({
    List<AccountListItem>? accountList,
    double? balance,
    String? country,
    String? currency,
    String? email,
    String? fullname,
    bool? isVirtual,
    String? landingCompanyFullname,
    String? landingCompanyName,
    List<AuthorizeLinkedToItem>? linkedTo,
    Map<String, LocalCurrenciesProperty>? localCurrencies,
    String? loginid,
    String? preferredLanguage,
    List<String>? scopes,
    List<dynamic>? upgradeableLandingCompanies,
    int? userId,
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
        linkedTo: linkedTo ?? this.linkedTo,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        loginid: loginid ?? this.loginid,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        scopes: scopes ?? this.scopes,
        upgradeableLandingCompanies:
            upgradeableLandingCompanies ?? this.upgradeableLandingCompanies,
        userId: userId ?? this.userId,
      );
}

/// Account list item model class.
abstract class AccountListItemModel {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    this.accountCategory,
    this.accountType,
    this.broker,
    this.createdAt,
    this.currency,
    this.excludedUntil,
    this.isDisabled,
    this.isVirtual,
    this.landingCompanyName,
    this.linkedTo,
    this.loginid,
  });

  /// Account category.
  final AccountCategoryEnum? accountCategory;

  /// Account type.
  final String? accountType;

  /// 2 letter broker code.
  final String? broker;

  /// Creation time of the account as epoch.
  final DateTime? createdAt;

  /// Currency of specified account.
  final String? currency;

  /// Epoch of date till client has excluded him/herself from the website, only present if client is self excluded.
  final DateTime? excludedUntil;

  /// Boolean value: `true` or `false`, indicating whether the account is marked as disabled or not.
  final bool? isDisabled;

  /// Boolean value: `true` or `false`, indicating whether the account is a virtual-money account.
  final bool? isVirtual;

  /// Landing company shortcode the account belongs to.
  final String? landingCompanyName;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<LinkedToItem>? linkedTo;

  /// The account ID of specified account.
  final String? loginid;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    super.accountCategory,
    super.accountType,
    super.broker,
    super.createdAt,
    super.currency,
    super.excludedUntil,
    super.isDisabled,
    super.isVirtual,
    super.landingCompanyName,
    super.linkedTo,
    super.loginid,
  });

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountCategory: json['account_category'] == null
            ? null
            : accountCategoryEnumMapper[json['account_category']],
        accountType: json['account_type'],
        broker: json['broker'],
        createdAt: getDateTime(json['created_at']),
        currency: json['currency'],
        excludedUntil: getDateTime(json['excluded_until']),
        isDisabled: getBool(json['is_disabled']),
        isVirtual: getBool(json['is_virtual']),
        landingCompanyName: json['landing_company_name'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<LinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => LinkedToItem.fromJson(item),
                ),
              ),
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_category'] = accountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, AccountCategoryEnum> entry) =>
            entry.value == accountCategory)
        .key;
    resultMap['account_type'] = accountType;
    resultMap['broker'] = broker;
    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['currency'] = currency;
    resultMap['excluded_until'] = getSecondsSinceEpochDateTime(excludedUntil);
    resultMap['is_disabled'] = isDisabled;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_name'] = landingCompanyName;
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (LinkedToItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['loginid'] = loginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountCategoryEnum? accountCategory,
    String? accountType,
    String? broker,
    DateTime? createdAt,
    String? currency,
    DateTime? excludedUntil,
    bool? isDisabled,
    bool? isVirtual,
    String? landingCompanyName,
    List<LinkedToItem>? linkedTo,
    String? loginid,
  }) =>
      AccountListItem(
        accountCategory: accountCategory ?? this.accountCategory,
        accountType: accountType ?? this.accountType,
        broker: broker ?? this.broker,
        createdAt: createdAt ?? this.createdAt,
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        linkedTo: linkedTo ?? this.linkedTo,
        loginid: loginid ?? this.loginid,
      );
}

/// Linked to item model class.
abstract class LinkedToItemModel {
  /// Initializes Linked to item model class .
  const LinkedToItemModel({
    this.loginid,
    this.platform,
  });

  /// Account ID.
  final String? loginid;

  /// Account platform name.
  final PlatformEnum? platform;
}

/// Linked to item class.
class LinkedToItem extends LinkedToItemModel {
  /// Initializes Linked to item class.
  const LinkedToItem({
    super.loginid,
    super.platform,
  });

  /// Creates an instance from JSON.
  factory LinkedToItem.fromJson(Map<String, dynamic> json) => LinkedToItem(
        loginid: json['loginid'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkedToItem copyWith({
    String? loginid,
    PlatformEnum? platform,
  }) =>
      LinkedToItem(
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
      );
}

/// Authorize linked to item model class.
abstract class AuthorizeLinkedToItemModel {
  /// Initializes Authorize linked to item model class .
  const AuthorizeLinkedToItemModel({
    this.loginid,
    this.platform,
  });

  /// Account ID.
  final String? loginid;

  /// Account platform name.
  final PlatformEnum? platform;
}

/// Authorize linked to item class.
class AuthorizeLinkedToItem extends AuthorizeLinkedToItemModel {
  /// Initializes Authorize linked to item class.
  const AuthorizeLinkedToItem({
    super.loginid,
    super.platform,
  });

  /// Creates an instance from JSON.
  factory AuthorizeLinkedToItem.fromJson(Map<String, dynamic> json) =>
      AuthorizeLinkedToItem(
        loginid: json['loginid'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuthorizeLinkedToItem copyWith({
    String? loginid,
    PlatformEnum? platform,
  }) =>
      AuthorizeLinkedToItem(
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
      );
}

/// Local currencies property model class.
abstract class LocalCurrenciesPropertyModel {
  /// Initializes Local currencies property model class .
  const LocalCurrenciesPropertyModel({
    required this.fractionalDigits,
  });

  /// Number of fractional digits.
  final int fractionalDigits;
}

/// Local currencies property class.
class LocalCurrenciesProperty extends LocalCurrenciesPropertyModel {
  /// Initializes Local currencies property class.
  const LocalCurrenciesProperty({
    required super.fractionalDigits,
  });

  /// Creates an instance from JSON.
  factory LocalCurrenciesProperty.fromJson(Map<String, dynamic> json) =>
      LocalCurrenciesProperty(
        fractionalDigits: json['fractional_digits'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LocalCurrenciesProperty copyWith({
    int? fractionalDigits,
  }) =>
      LocalCurrenciesProperty(
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
      );
}
