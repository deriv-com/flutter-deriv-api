import 'package:flutter_deriv_api/api/application/models/new_account_real_model.dart';

/// New account real class
class NewAccountReal extends NewAccountRealModel {
  /// Initializes
  NewAccountReal({
    String clientId,
    String landingCompany,
    String landingCompanyShort,
    String oauthToken,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          landingCompanyShort: landingCompanyShort,
          oauthToken: oauthToken,
        );

  /// Generate an instance from json
  factory NewAccountReal.fromJson(Map<String, dynamic> json) => NewAccountReal(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        landingCompanyShort: json['landing_company_short'],
        oauthToken: json['oauth_token'],
      );

  /// Generate a copy of instance with given parameters
  NewAccountReal copyWith({
    String clientId,
    String landingCompany,
    String landingCompanyShort,
    String oauthToken,
  }) =>
      NewAccountReal(
        clientId: clientId ?? this.clientId,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        oauthToken: oauthToken ?? this.oauthToken,
      );
}
