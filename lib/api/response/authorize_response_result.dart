// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

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
    Authorize? authorize,
  }) : super(
          authorize: authorize,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  ///
  /// For parameters information refer to [AuthorizeRequest].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<AuthorizeResponse> authorizeMethod(
      AuthorizeRequest request) async {
    final AuthorizeReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AuthorizeException(baseExceptionModel: baseExceptionModel),
    );

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

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "trading": AccountTypeEnum.trading,
  "wallet": AccountTypeEnum.wallet,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// trading.
  trading,

  /// wallet.
  wallet,
}

/// PlatformEnum mapper.
final Map<String, PlatformEnum> platformEnumMapper = <String, PlatformEnum>{
  "deriv": PlatformEnum.deriv,
  "dxtrade": PlatformEnum.dxtrade,
  "mt5": PlatformEnum.mt5,
};

/// Platform Enum.
enum PlatformEnum {
  /// deriv.
  deriv,

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
    this.localCurrencies,
    this.loginid,
    this.preferredLanguage,
    this.scopes,
    this.trading,
    this.upgradeableLandingCompanies,
    this.userId,
    this.wallet,
  });

  /// List of accounts for current user.
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

  /// Currencies in client's residence country
  final Map<String, LocalCurrenciesProperty>? localCurrencies;

  /// The account ID that the token was issued for.
  final String? loginid;

  /// User's preferred language, ISO standard code of language
  final String? preferredLanguage;

  /// Scopes available to the token.
  final List<String>? scopes;

  /// Details of the Trading account.
  final AuthorizeTrading? trading;

  /// List of landing company shortcodes the account can upgrade to.
  final List<dynamic>? upgradeableLandingCompanies;

  /// The internal user ID for this account.
  final int? userId;

  /// Details of the Wallet account.
  final AuthorizeWallet? wallet;
}

/// Authorize class.
class Authorize extends AuthorizeModel {
  /// Initializes Authorize class.
  const Authorize({
    List<AccountListItem>? accountList,
    double? balance,
    String? country,
    String? currency,
    String? email,
    String? fullname,
    bool? isVirtual,
    String? landingCompanyFullname,
    String? landingCompanyName,
    Map<String, LocalCurrenciesProperty>? localCurrencies,
    String? loginid,
    String? preferredLanguage,
    List<String>? scopes,
    AuthorizeTrading? trading,
    List<dynamic>? upgradeableLandingCompanies,
    int? userId,
    AuthorizeWallet? wallet,
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
          preferredLanguage: preferredLanguage,
          scopes: scopes,
          trading: trading,
          upgradeableLandingCompanies: upgradeableLandingCompanies,
          userId: userId,
          wallet: wallet,
        );

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
        trading: json['trading'] == null
            ? null
            : AuthorizeTrading.fromJson(json['trading']),
        upgradeableLandingCompanies:
            json['upgradeable_landing_companies'] == null
                ? null
                : List<dynamic>.from(
                    json['upgradeable_landing_companies']?.map(
                      (dynamic item) => item,
                    ),
                  ),
        userId: json['user_id'],
        wallet: json['wallet'] == null
            ? null
            : AuthorizeWallet.fromJson(json['wallet']),
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
    if (trading != null) {
      resultMap['trading'] = trading!.toJson();
    }
    if (upgradeableLandingCompanies != null) {
      resultMap['upgradeable_landing_companies'] = upgradeableLandingCompanies!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['user_id'] = userId;
    if (wallet != null) {
      resultMap['wallet'] = wallet!.toJson();
    }

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
    Map<String, LocalCurrenciesProperty>? localCurrencies,
    String? loginid,
    String? preferredLanguage,
    List<String>? scopes,
    AuthorizeTrading? trading,
    List<dynamic>? upgradeableLandingCompanies,
    int? userId,
    AuthorizeWallet? wallet,
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
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        scopes: scopes ?? this.scopes,
        trading: trading ?? this.trading,
        upgradeableLandingCompanies:
            upgradeableLandingCompanies ?? this.upgradeableLandingCompanies,
        userId: userId ?? this.userId,
        wallet: wallet ?? this.wallet,
      );
}
/// Account list item model class.
abstract class AccountListItemModel {
  /// Initializes Account list item model class .
  const AccountListItemModel({
    this.accountType,
    this.createdAt,
    this.currency,
    this.excludedUntil,
    this.isDisabled,
    this.isVirtual,
    this.landingCompanyName,
    this.loginid,
    this.trading,
    this.wallet,
  });

  /// Account type.
  final AccountTypeEnum? accountType;

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

  /// The account ID of specified account.
  final String? loginid;

  /// Details of the Trading account.
  final Trading? trading;

  /// Details of the Wallet account.
  final Wallet? wallet;
}

/// Account list item class.
class AccountListItem extends AccountListItemModel {
  /// Initializes Account list item class.
  const AccountListItem({
    AccountTypeEnum? accountType,
    DateTime? createdAt,
    String? currency,
    DateTime? excludedUntil,
    bool? isDisabled,
    bool? isVirtual,
    String? landingCompanyName,
    String? loginid,
    Trading? trading,
    Wallet? wallet,
  }) : super(
          accountType: accountType,
          createdAt: createdAt,
          currency: currency,
          excludedUntil: excludedUntil,
          isDisabled: isDisabled,
          isVirtual: isVirtual,
          landingCompanyName: landingCompanyName,
          loginid: loginid,
          trading: trading,
          wallet: wallet,
        );

  /// Creates an instance from JSON.
  factory AccountListItem.fromJson(Map<String, dynamic> json) =>
      AccountListItem(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        createdAt: getDateTime(json['created_at']),
        currency: json['currency'],
        excludedUntil: getDateTime(json['excluded_until']),
        isDisabled: getBool(json['is_disabled']),
        isVirtual: getBool(json['is_virtual']),
        landingCompanyName: json['landing_company_name'],
        loginid: json['loginid'],
        trading:
            json['trading'] == null ? null : Trading.fromJson(json['trading']),
        wallet: json['wallet'] == null ? null : Wallet.fromJson(json['wallet']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['created_at'] = getSecondsSinceEpochDateTime(createdAt);
    resultMap['currency'] = currency;
    resultMap['excluded_until'] = getSecondsSinceEpochDateTime(excludedUntil);
    resultMap['is_disabled'] = isDisabled;
    resultMap['is_virtual'] = isVirtual;
    resultMap['landing_company_name'] = landingCompanyName;
    resultMap['loginid'] = loginid;
    if (trading != null) {
      resultMap['trading'] = trading!.toJson();
    }
    if (wallet != null) {
      resultMap['wallet'] = wallet!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountListItem copyWith({
    AccountTypeEnum? accountType,
    DateTime? createdAt,
    String? currency,
    DateTime? excludedUntil,
    bool? isDisabled,
    bool? isVirtual,
    String? landingCompanyName,
    String? loginid,
    Trading? trading,
    Wallet? wallet,
  }) =>
      AccountListItem(
        accountType: accountType ?? this.accountType,
        createdAt: createdAt ?? this.createdAt,
        currency: currency ?? this.currency,
        excludedUntil: excludedUntil ?? this.excludedUntil,
        isDisabled: isDisabled ?? this.isDisabled,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        loginid: loginid ?? this.loginid,
        trading: trading ?? this.trading,
        wallet: wallet ?? this.wallet,
      );
}
/// Trading model class.
abstract class TradingModel {
  /// Initializes Trading model class .
  const TradingModel({
    this.linkedTo,
  });

  /// Details of the Wallet account linked to the Trading account.
  final List<LinkedToItem>? linkedTo;
}

/// Trading class.
class Trading extends TradingModel {
  /// Initializes Trading class.
  const Trading({
    List<LinkedToItem>? linkedTo,
  }) : super(
          linkedTo: linkedTo,
        );

  /// Creates an instance from JSON.
  factory Trading.fromJson(Map<String, dynamic> json) => Trading(
        linkedTo: json['linked_to'] == null
            ? null
            : List<LinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => LinkedToItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (LinkedToItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Trading copyWith({
    List<LinkedToItem>? linkedTo,
  }) =>
      Trading(
        linkedTo: linkedTo ?? this.linkedTo,
      );
}
/// Linked to item model class.
abstract class LinkedToItemModel {
  /// Initializes Linked to item model class .
  const LinkedToItemModel({
    this.accountId,
    this.balance,
    this.currency,
    this.paymentMethod,
  });

  /// Wallet account ID.
  final String? accountId;

  /// Wallet account balance.
  final String? balance;

  /// Wallet account currency.
  final String? currency;

  /// Wallet account payment method.
  final String? paymentMethod;
}

/// Linked to item class.
class LinkedToItem extends LinkedToItemModel {
  /// Initializes Linked to item class.
  const LinkedToItem({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory LinkedToItem.fromJson(Map<String, dynamic> json) => LinkedToItem(
        accountId: json['account_id'],
        balance: json['balance'],
        currency: json['currency'],
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LinkedToItem copyWith({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) =>
      LinkedToItem(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Wallet model class.
abstract class WalletModel {
  /// Initializes Wallet model class .
  const WalletModel({
    this.accountId,
    this.balance,
    this.currency,
    this.linkedTo,
    this.paymentMethod,
  });

  /// Wallet account ID.
  final String? accountId;

  /// Wallet account balance.
  final double? balance;

  /// Wallet account currency.
  final String? currency;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<WalletLinkedToItem>? linkedTo;

  /// Wallet account payment method.
  final String? paymentMethod;
}

/// Wallet class.
class Wallet extends WalletModel {
  /// Initializes Wallet class.
  const Wallet({
    String? accountId,
    double? balance,
    String? currency,
    List<WalletLinkedToItem>? linkedTo,
    String? paymentMethod,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          linkedTo: linkedTo,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        accountId: json['account_id'],
        balance: getDouble(json['balance']),
        currency: json['currency'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<WalletLinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => WalletLinkedToItem.fromJson(item),
                ),
              ),
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (WalletLinkedToItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Wallet copyWith({
    String? accountId,
    double? balance,
    String? currency,
    List<WalletLinkedToItem>? linkedTo,
    String? paymentMethod,
  }) =>
      Wallet(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        linkedTo: linkedTo ?? this.linkedTo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Wallet linked to item model class.
abstract class WalletLinkedToItemModel {
  /// Initializes Wallet linked to item model class .
  const WalletLinkedToItemModel({
    this.accountId,
    this.balance,
    this.currency,
    this.platform,
  });

  /// Trading account ID.
  final String? accountId;

  /// Trading account balance.
  final String? balance;

  /// Trading account currency.
  final String? currency;

  /// Trading account platform name.
  final PlatformEnum? platform;
}

/// Wallet linked to item class.
class WalletLinkedToItem extends WalletLinkedToItemModel {
  /// Initializes Wallet linked to item class.
  const WalletLinkedToItem({
    String? accountId,
    String? balance,
    String? currency,
    PlatformEnum? platform,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          platform: platform,
        );

  /// Creates an instance from JSON.
  factory WalletLinkedToItem.fromJson(Map<String, dynamic> json) =>
      WalletLinkedToItem(
        accountId: json['account_id'],
        balance: json['balance'],
        currency: json['currency'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletLinkedToItem copyWith({
    String? accountId,
    String? balance,
    String? currency,
    PlatformEnum? platform,
  }) =>
      WalletLinkedToItem(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
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
    required int fractionalDigits,
  }) : super(
          fractionalDigits: fractionalDigits,
        );

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
/// Authorize trading model class.
abstract class AuthorizeTradingModel {
  /// Initializes Authorize trading model class .
  const AuthorizeTradingModel({
    this.linkedTo,
  });

  /// Details of the Wallet account linked to the Trading account.
  final List<TradingLinkedToItem>? linkedTo;
}

/// Authorize trading class.
class AuthorizeTrading extends AuthorizeTradingModel {
  /// Initializes Authorize trading class.
  const AuthorizeTrading({
    List<TradingLinkedToItem>? linkedTo,
  }) : super(
          linkedTo: linkedTo,
        );

  /// Creates an instance from JSON.
  factory AuthorizeTrading.fromJson(Map<String, dynamic> json) =>
      AuthorizeTrading(
        linkedTo: json['linked_to'] == null
            ? null
            : List<TradingLinkedToItem>.from(
                json['linked_to']?.map(
                  (dynamic item) => TradingLinkedToItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (TradingLinkedToItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuthorizeTrading copyWith({
    List<TradingLinkedToItem>? linkedTo,
  }) =>
      AuthorizeTrading(
        linkedTo: linkedTo ?? this.linkedTo,
      );
}
/// Trading linked to item model class.
abstract class TradingLinkedToItemModel {
  /// Initializes Trading linked to item model class .
  const TradingLinkedToItemModel({
    this.accountId,
    this.balance,
    this.currency,
    this.paymentMethod,
  });

  /// Wallet account ID.
  final String? accountId;

  /// Wallet account balance.
  final String? balance;

  /// Wallet account currency.
  final String? currency;

  /// Wallet account payment method.
  final String? paymentMethod;
}

/// Trading linked to item class.
class TradingLinkedToItem extends TradingLinkedToItemModel {
  /// Initializes Trading linked to item class.
  const TradingLinkedToItem({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory TradingLinkedToItem.fromJson(Map<String, dynamic> json) =>
      TradingLinkedToItem(
        accountId: json['account_id'],
        balance: json['balance'],
        currency: json['currency'],
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingLinkedToItem copyWith({
    String? accountId,
    String? balance,
    String? currency,
    String? paymentMethod,
  }) =>
      TradingLinkedToItem(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Authorize wallet model class.
abstract class AuthorizeWalletModel {
  /// Initializes Authorize wallet model class .
  const AuthorizeWalletModel({
    this.accountId,
    this.balance,
    this.currency,
    this.linkedTo,
    this.paymentMethod,
  });

  /// Wallet account ID.
  final String? accountId;

  /// Wallet account balance.
  final double? balance;

  /// Wallet account currency.
  final String? currency;

  /// Details of the list of Trading accounts linked to the Wallet account.
  final List<WalletLinkedToItem8>? linkedTo;

  /// Wallet account payment method.
  final String? paymentMethod;
}

/// Authorize wallet class.
class AuthorizeWallet extends AuthorizeWalletModel {
  /// Initializes Authorize wallet class.
  const AuthorizeWallet({
    String? accountId,
    double? balance,
    String? currency,
    List<WalletLinkedToItem8>? linkedTo,
    String? paymentMethod,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          linkedTo: linkedTo,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory AuthorizeWallet.fromJson(Map<String, dynamic> json) =>
      AuthorizeWallet(
        accountId: json['account_id'],
        balance: getDouble(json['balance']),
        currency: json['currency'],
        linkedTo: json['linked_to'] == null
            ? null
            : List<WalletLinkedToItem8>.from(
                json['linked_to']?.map(
                  (dynamic item) => WalletLinkedToItem8.fromJson(item),
                ),
              ),
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    if (linkedTo != null) {
      resultMap['linked_to'] = linkedTo!
          .map<dynamic>(
            (WalletLinkedToItem8 item) => item.toJson(),
          )
          .toList();
    }
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuthorizeWallet copyWith({
    String? accountId,
    double? balance,
    String? currency,
    List<WalletLinkedToItem8>? linkedTo,
    String? paymentMethod,
  }) =>
      AuthorizeWallet(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        linkedTo: linkedTo ?? this.linkedTo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Wallet linked to item8 model class.
abstract class WalletLinkedToItem8Model {
  /// Initializes Wallet linked to item8 model class .
  const WalletLinkedToItem8Model({
    this.accountId,
    this.balance,
    this.currency,
    this.platform,
  });

  /// Trading account ID.
  final String? accountId;

  /// Trading account balance.
  final String? balance;

  /// Trading account currency.
  final String? currency;

  /// Trading account platform name.
  final PlatformEnum? platform;
}

/// Wallet linked to item8 class.
class WalletLinkedToItem8 extends WalletLinkedToItem8Model {
  /// Initializes Wallet linked to item8 class.
  const WalletLinkedToItem8({
    String? accountId,
    String? balance,
    String? currency,
    PlatformEnum? platform,
  }) : super(
          accountId: accountId,
          balance: balance,
          currency: currency,
          platform: platform,
        );

  /// Creates an instance from JSON.
  factory WalletLinkedToItem8.fromJson(Map<String, dynamic> json) =>
      WalletLinkedToItem8(
        accountId: json['account_id'],
        balance: json['balance'],
        currency: json['currency'],
        platform: json['platform'] == null
            ? null
            : platformEnumMapper[json['platform']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['platform'] = platformEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PlatformEnum> entry) => entry.value == platform)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WalletLinkedToItem8 copyWith({
    String? accountId,
    String? balance,
    String? currency,
    PlatformEnum? platform,
  }) =>
      WalletLinkedToItem8(
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        platform: platform ?? this.platform,
      );
}
