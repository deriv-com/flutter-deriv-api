// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// New account wallet response model class.
abstract class NewAccountWalletResponseModel {
  /// Initializes New account wallet response model class .
  const NewAccountWalletResponseModel({
    this.newAccountWallet,
  });

  /// New wallet account details
  final NewAccountWallet? newAccountWallet;
}

/// New account wallet response class.
class NewAccountWalletResponse extends NewAccountWalletResponseModel {
  /// Initializes New account wallet response class.
  const NewAccountWalletResponse({
    super.newAccountWallet,
  });

  /// Creates an instance from JSON.
  factory NewAccountWalletResponse.fromJson(
    dynamic newAccountWalletJson,
  ) =>
      NewAccountWalletResponse(
        newAccountWallet: newAccountWalletJson == null
            ? null
            : NewAccountWallet.fromJson(newAccountWalletJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountWallet != null) {
      resultMap['new_account_wallet'] = newAccountWallet!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountWalletResponse copyWith({
    NewAccountWallet? newAccountWallet,
  }) =>
      NewAccountWalletResponse(
        newAccountWallet: newAccountWallet ?? this.newAccountWallet,
      );
}

/// New account wallet model class.
abstract class NewAccountWalletModel {
  /// Initializes New account wallet model class .
  const NewAccountWalletModel({
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.currency,
    this.landingCompanyShort,
    this.landingCompanyShortcode,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of new real money account
  final String clientId;

  /// Currency of an account
  final String? currency;

  /// Landing company shortcode
  final String? landingCompanyShort;

  /// Landing company shortcode
  final String? landingCompanyShortcode;
}

/// New account wallet class.
class NewAccountWallet extends NewAccountWalletModel {
  /// Initializes New account wallet class.
  const NewAccountWallet({
    required super.clientId,
    required super.landingCompany,
    required super.oauthToken,
    super.currency,
    super.landingCompanyShort,
    super.landingCompanyShortcode,
  });

  /// Creates an instance from JSON.
  factory NewAccountWallet.fromJson(Map<String, dynamic> json) =>
      NewAccountWallet(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        currency: json['currency'],
        landingCompanyShort: json['landing_company_short'],
        landingCompanyShortcode: json['landing_company_shortcode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['currency'] = currency;
    resultMap['landing_company_short'] = landingCompanyShort;
    resultMap['landing_company_shortcode'] = landingCompanyShortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountWallet copyWith({
    String? clientId,
    String? landingCompany,
    String? oauthToken,
    String? currency,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) =>
      NewAccountWallet(
        clientId: clientId ?? this.clientId,
        landingCompany: landingCompany ?? this.landingCompany,
        oauthToken: oauthToken ?? this.oauthToken,
        currency: currency ?? this.currency,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );
}
