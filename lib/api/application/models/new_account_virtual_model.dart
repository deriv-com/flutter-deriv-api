import 'package:flutter_deriv_api/api/application/models/new_account_base_model.dart';

/// New account virtual model class
abstract class NewAccountVirtualModel extends NewAccountBaseModel {
  /// Initializes
  NewAccountVirtualModel({
    this.balance,
    String clientId,
    this.currency,
    this.email,
    String oauthToken,
  }) : super(
          clientId: clientId,
          oauthToken: oauthToken,
        );

  /// Account balance
  final double balance;

  /// Account currency
  final String currency;

  /// Email of the new virtual-money account
  final String email;
}
