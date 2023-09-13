// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


/// New account maltainvest response model class.
abstract class NewAccountMaltainvestResponseModel {
  /// Initializes New account maltainvest response model class .
  const NewAccountMaltainvestResponseModel({
    this.newAccountMaltainvest,
  });

  /// New `maltainvest` account details
  final NewAccountMaltainvest? newAccountMaltainvest;
}

/// New account maltainvest response class.
class NewAccountMaltainvestResponse extends NewAccountMaltainvestResponseModel {
  /// Initializes New account maltainvest response class.
  const NewAccountMaltainvestResponse({
    super.newAccountMaltainvest,
  });

  /// Creates an instance from JSON.
  factory NewAccountMaltainvestResponse.fromJson(
    dynamic newAccountMaltainvestJson,
  ) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest: newAccountMaltainvestJson == null
            ? null
            : NewAccountMaltainvest.fromJson(newAccountMaltainvestJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountMaltainvest != null) {
      resultMap['new_account_maltainvest'] = newAccountMaltainvest!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountMaltainvestResponse copyWith({
    NewAccountMaltainvest? newAccountMaltainvest,
  }) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
      );
}
/// New account maltainvest model class.
abstract class NewAccountMaltainvestModel {
  /// Initializes New account maltainvest model class .
  const NewAccountMaltainvestModel({
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

  /// Client ID of new `maltainvest` account
  final String clientId;

  /// Landing company shortcode
  final String? landingCompanyShort;

  /// Landing company shortcode
  final String? landingCompanyShortcode;
}

/// New account maltainvest class.
class NewAccountMaltainvest extends NewAccountMaltainvestModel {
  /// Initializes New account maltainvest class.
  const NewAccountMaltainvest({
    required super.clientId,
    required super.landingCompany,
    required super.oauthToken,
    super.landingCompanyShort,
    super.landingCompanyShortcode,
  });

  /// Creates an instance from JSON.
  factory NewAccountMaltainvest.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvest(
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
  NewAccountMaltainvest copyWith({
    String? clientId,
    String? landingCompany,
    String? oauthToken,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) =>
      NewAccountMaltainvest(
        clientId: clientId ?? this.clientId,
        landingCompany: landingCompany ?? this.landingCompany,
        oauthToken: oauthToken ?? this.oauthToken,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );
}
