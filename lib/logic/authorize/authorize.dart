import 'package:flutter_deriv_api/logic/authorize/account.dart';
import 'package:flutter_deriv_api/models/authorize/authorize.dart';
import 'package:flutter_deriv_api/models/authorize/local_currency.dart';

/// Authorize class
class Authorize extends AuthorizeModel {
  /// Class constructor
  Authorize({
    List<Account> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullname,
    bool isVirtual,
    String landingCompanyFullname,
    String landingCompanyName,
    List<LocalCurrencyModel> localCurrencies,
    String loginid,
    List<String> scopes,
    List<String> upgradeableLandingCompanies,
    int userId,
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

  /// Generate instance from json
  factory Authorize.fromJson(Map<String, dynamic> json) => Authorize(
        accountList: json['account_list'] == null
            ? null
            : json['account_list']
                .map<Account>(
                    (Map<String, dynamic> item) => Account.fromJson(item))
                .toList(),
        balance: json['balance'],
        country: json['country'],
        currency: json['currency'],
        email: json['email'],
        fullname: json['fullname'],
        isVirtual: json['is_virtual'],
        landingCompanyFullname: json['landing_company_fullname'],
        landingCompanyName: json['landing_company_name'],
        localCurrencies: json['local_currencies'] == null
            ? null
            : json['local_currencies']
                .map<LocalCurrencyModel>((Map<String, dynamic> item) =>
                    LocalCurrencyModel.fromJson(item))
                .toList(),
        loginid: json['loginid'],
        scopes: json['scopes'] == null
            ? null
            : json['scopes']
                .map<String>((Map<String, dynamic> item) => item)
                .toList(),
        upgradeableLandingCompanies:
            json['upgradeable_landing_companies'] == null
                ? null
                : json['upgradeable_landing_companies']
                    .map<String>((Map<String, dynamic> item) => item)
                    .toList(),
        userId: json['user_id'],
      );

  /// Generate copy of instance with given parameters
  Authorize copyWith({
    List<Account> accountList,
    double balance,
    String country,
    String currency,
    String email,
    String fullname,
    bool isVirtual,
    String landingCompanyFullname,
    String landingCompanyName,
    List<LocalCurrencyModel> localCurrencies,
    String loginid,
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
