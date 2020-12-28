/// New account real receive model class
abstract class NewAccountRealReceiveModel {
  /// Initializes
  NewAccountRealReceiveModel({
    @required this.newAccountReal,
  });

  /// New real money account details
  final NewAccountReal newAccountReal;
}

/// New account real receive class
class NewAccountRealReceive extends NewAccountRealReceiveModel {
  /// Initializes
  NewAccountRealReceive({
    @required NewAccountReal newAccountReal,
  }) : super(
          newAccountReal: newAccountReal,
        );

  /// Creates an instance from JSON
  factory NewAccountRealReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountRealReceive(
        newAccountReal: json['new_account_real'] == null
            ? null
            : NewAccountReal.fromJson(json['new_account_real']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (newAccountReal != null) {
      result['new_account_real'] = newAccountReal.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  NewAccountRealReceive copyWith({
    NewAccountReal newAccountReal,
  }) =>
      NewAccountRealReceive(
        newAccountReal: newAccountReal ?? this.newAccountReal,
      );
}
/// New account real model class
abstract class NewAccountRealModel {
  /// Initializes
  NewAccountRealModel({
    @required this.clientId,
    @required this.landingCompany,
    @required this.landingCompanyShort,
    @required this.oauthToken,
  });

  /// Client ID of new real money account
  final String clientId;

  /// Landing company full name
  final String landingCompany;

  /// Landing company shortcode
  final String landingCompanyShort;

  /// OAuth token for client's login session
  final String oauthToken;
}

/// New account real class
class NewAccountReal extends NewAccountRealModel {
  /// Initializes
  NewAccountReal({
    @required String clientId,
    @required String landingCompany,
    @required String landingCompanyShort,
    @required String oauthToken,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          landingCompanyShort: landingCompanyShort,
          oauthToken: oauthToken,
        );

  /// Creates an instance from JSON
  factory NewAccountReal.fromJson(Map<String, dynamic> json) => NewAccountReal(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        landingCompanyShort: json['landing_company_short'],
        oauthToken: json['oauth_token'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['client_id'] = clientId;
    result['landing_company'] = landingCompany;
    result['landing_company_short'] = landingCompanyShort;
    result['oauth_token'] = oauthToken;

    return result;
  }

  /// Creates a copy of instance with given parameters
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
