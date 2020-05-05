import 'package:flutter_deriv_api/api/application/models/new_account_virtual_model.dart';

/// New account virtual class
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtual({
    double balance,
    String clientId,
    String currency,
    String email,
    String oauthToken,
  }) : super(
          balance: balance,
          clientId: clientId,
          currency: currency,
          email: email,
          oauthToken: oauthToken,
        );

  /// Generates an instance from json
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: json['balance']?.toDouble(),
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
      );

  /// Generates a copy of instance with given parameters
  NewAccountVirtual copyWith({
    double balance,
    String clientId,
    String currency,
    String email,
    String oauthToken,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
      );
}
