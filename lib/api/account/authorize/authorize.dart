import 'package:flutter_deriv_api/api/account/account.dart';
import 'package:flutter_deriv_api/api/account/authorize/exceptions/authorize_exception.dart';
import 'package:flutter_deriv_api/api/account/models/authorize_model.dart';
import 'package:flutter_deriv_api/api/account/models/local_currency_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Authorize class
class Authorize extends AuthorizeModel {
  /// Initializes
  Authorize({
    List<Account> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullName,
    bool isVirtual,
    String landingCompanyFullName,
    String landingCompanyName,
    List<LocalCurrencyModel> localCurrencies,
    String loginId,
    List<String> scopes,
    List<String> upgradeableLandingCompanies,
    int userId,
  }) : super(
          accountList: accountList,
          balance: balance,
          country: country,
          currency: currency,
          email: email,
          fullName: fullName,
          isVirtual: isVirtual,
          landingCompanyFullName: landingCompanyFullName,
          landingCompanyName: landingCompanyName,
          localCurrencies: localCurrencies,
          loginId: loginId,
          scopes: scopes,
          upgradeableLandingCompanies: upgradeableLandingCompanies,
          userId: userId,
        );

  /// Generate an instance from JSON
  factory Authorize.fromJson(Map<String, dynamic> json) => Authorize(
        accountList: getListFromMap(
          json['account_list'],
          itemToTypeCallback: (dynamic item) => Account.fromJson(item),
        ),
        balance: json['balance']?.toDouble(),
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullName: json['fullname'],
        isVirtual: getBool(json['is_virtual']),
        landingCompanyFullName: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        localCurrencies: getListFromMap(
          json['local_currencies'].entries,
          itemToTypeCallback: (dynamic item) => LocalCurrencyModel.fromJson(
            <String, dynamic>{
              'key': item.key,
              'values': item.value,
            },
          ),
        ),
        loginId: json['loginid'],
        scopes: getListFromMap(json['scopes']),
        upgradeableLandingCompanies: getListFromMap(
          json['upgradeable_landing_companies'],
        ),
        userId: json['user_id'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  Authorize copyWith({
    List<Account> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullName,
    bool isVirtual,
    String landingCompanyFullName,
    String landingCompanyName,
    List<LocalCurrencyModel> localCurrencies,
    String loginId,
    List<String> scopes,
    List<String> upgradeableLandingCompanies,
    int userId,
  }) =>
      Authorize(
        accountList: accountList ?? this.accountList,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        isVirtual: isVirtual ?? this.isVirtual,
        landingCompanyFullName:
            landingCompanyFullName ?? this.landingCompanyFullName,
        landingCompanyName: landingCompanyName ?? this.landingCompanyName,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        loginId: loginId ?? this.loginId,
        scopes: scopes ?? this.scopes,
        upgradeableLandingCompanies:
            upgradeableLandingCompanies ?? this.upgradeableLandingCompanies,
        userId: userId ?? this.userId,
      );

  /// Authorizes current WebSocket session to act on behalf of the owner of a given token.
  /// For parameters information refer to [AuthorizeRequest].
  static Future<Authorize> authorize(AuthorizeRequest request) async {
    final AuthorizeResponse response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => AuthorizeException(
        message: message,
      ),
    );

    return Authorize.fromJson(response.authorize);
  }
}
