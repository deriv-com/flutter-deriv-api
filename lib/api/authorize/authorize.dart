import 'package:flutter_deriv_api/api/authorize/account.dart';
import 'package:flutter_deriv_api/api/models/authorize_model.dart';
import 'package:flutter_deriv_api/api/models/local_currency_model.dart';
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

  /// Generate an instance from json
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
}
