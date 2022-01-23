// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate account add response model class.
abstract class AffiliateAccountAddResponseModel extends Equatable {
  /// Initializes Affiliate account add response model class .
  const AffiliateAccountAddResponseModel({
    this.affiliateAccountAdd,
  });

  /// New real money account details
  final AffiliateAccountAdd? affiliateAccountAdd;
}

/// Affiliate account add response class.
class AffiliateAccountAddResponse extends AffiliateAccountAddResponseModel {
  /// Initializes Affiliate account add response class.
  const AffiliateAccountAddResponse({
    AffiliateAccountAdd? affiliateAccountAdd,
  }) : super(
          affiliateAccountAdd: affiliateAccountAdd,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAddResponse.fromJson(
    dynamic affiliateAccountAddJson,
  ) =>
      AffiliateAccountAddResponse(
        affiliateAccountAdd: affiliateAccountAddJson == null
            ? null
            : AffiliateAccountAdd.fromJson(affiliateAccountAddJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (affiliateAccountAdd != null) {
      resultMap['affiliate_account_add'] = affiliateAccountAdd!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAccountAddResponse copyWith({
    AffiliateAccountAdd? affiliateAccountAdd,
  }) =>
      AffiliateAccountAddResponse(
        affiliateAccountAdd: affiliateAccountAdd ?? this.affiliateAccountAdd,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Affiliate account add model class.
abstract class AffiliateAccountAddModel extends Equatable {
  /// Initializes Affiliate account add model class .
  const AffiliateAccountAddModel({
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.currency,
    this.landingCompanyShortcode,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of the new affiliate account
  final String clientId;

  /// Currency of the new account
  final String? currency;

  /// Landing company shortcode
  final String? landingCompanyShortcode;
}

/// Affiliate account add class.
class AffiliateAccountAdd extends AffiliateAccountAddModel {
  /// Initializes Affiliate account add class.
  const AffiliateAccountAdd({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? currency,
    String? landingCompanyShortcode,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          oauthToken: oauthToken,
          currency: currency,
          landingCompanyShortcode: landingCompanyShortcode,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAdd.fromJson(Map<String, dynamic> json) =>
      AffiliateAccountAdd(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        currency: json['currency'],
        landingCompanyShortcode: json['landing_company_shortcode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['currency'] = currency;
    resultMap['landing_company_shortcode'] = landingCompanyShortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAccountAdd copyWith({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? currency,
    String? landingCompanyShortcode,
  }) =>
      AffiliateAccountAdd(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        currency: currency ?? this.currency,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
