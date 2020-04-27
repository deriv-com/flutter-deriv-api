import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Account model class
abstract class AccountModel extends BaseModel {
  /// Class constructor
  AccountModel({
    this.currency,
    this.excludedUntil,
    this.isDisabled,
    this.isVirtual,
    this.landingCompanyName,
    this.loginId,
  });

  /// Currency of specified account.
  final String currency;

  /// Epoch of date till client has excluded him/herself from the website, only present if client is self excluded.
  final DateTime excludedUntil;

  /// Boolean value: true or false, indicating whether the account is marked as disabled or not.
  final bool isDisabled;

  /// Boolean value: true or false, indicating whether the account is a virtual-money account.
  final bool isVirtual;

  /// Landing company shortcode the account belongs to.
  final String landingCompanyName;

  /// The account ID of specified account.
  final String loginId;
}
