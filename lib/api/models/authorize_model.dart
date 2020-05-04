import 'package:flutter_deriv_api/api/models/account_model.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/local_currency_model.dart';

/// Authorize model class
abstract class AuthorizeModel extends BaseModel {
  /// Class constructor
  AuthorizeModel({
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
    this.loginId,
    this.scopes,
    this.upgradeableLandingCompanies,
    this.userId,
  });

  /// List of accounts for current user.
  final List<AccountModel> accountList;

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

  /// Boolean value: 1 or 0, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// Landing company name the account belongs to.
  final String landingCompanyFullname;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// Currencies in client's residence country
  final List<LocalCurrencyModel> localCurrencies;

  /// The account ID that the token was issued for.
  final String loginId;

  /// Scopes available to the token.
  final List<String> scopes;

  /// List of landing company shortcodes the account can upgrade to.
  final List<String> upgradeableLandingCompanies;

  /// The internal user ID for this account.
  final int userId;
}
