// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// New account wallet response model class.
abstract class NewAccountWalletResponseModel extends Equatable {
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
    NewAccountWallet? newAccountWallet,
  }) : super(
          newAccountWallet: newAccountWallet,
        );

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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// New account wallet model class.
abstract class NewAccountWalletModel extends Equatable {
  /// Initializes New account wallet model class .
  const NewAccountWalletModel({
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.landingCompanyShort,
    this.landingCompanyShortcode,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of new real money account
  final String clientId;

  /// Landing company shortcode
  final String? landingCompanyShort;

  /// Landing company shortcode
  final String? landingCompanyShortcode;
}

/// New account wallet class.
class NewAccountWallet extends NewAccountWalletModel {
  /// Initializes New account wallet class.
  const NewAccountWallet({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          oauthToken: oauthToken,
          landingCompanyShort: landingCompanyShort,
          landingCompanyShortcode: landingCompanyShortcode,
        );

  /// Creates an instance from JSON.
  factory NewAccountWallet.fromJson(Map<String, dynamic> json) =>
      NewAccountWallet(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        landingCompanyShort: json['landing_company_short'],
        landingCompanyShortcode: json['landing_company_shortcode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['landing_company_short'] = landingCompanyShort;
    resultMap['landing_company_shortcode'] = landingCompanyShortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountWallet copyWith({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) =>
      NewAccountWallet(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
