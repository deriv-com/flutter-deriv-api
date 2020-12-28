/// New account maltainvest receive model class
abstract class NewAccountMaltainvestReceiveModel {
  /// Initializes
  NewAccountMaltainvestReceiveModel({
    @required this.newAccountMaltainvest,
  });

  /// New `maltainvest` account details
  final NewAccountMaltainvest newAccountMaltainvest;
}

/// New account maltainvest receive class
class NewAccountMaltainvestReceive extends NewAccountMaltainvestReceiveModel {
  /// Initializes
  NewAccountMaltainvestReceive({
    @required NewAccountMaltainvest newAccountMaltainvest,
  }) : super(
          newAccountMaltainvest: newAccountMaltainvest,
        );

  /// Creates an instance from JSON
  factory NewAccountMaltainvestReceive.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvestReceive(
        newAccountMaltainvest: json['new_account_maltainvest'] == null
            ? null
            : NewAccountMaltainvest.fromJson(json['new_account_maltainvest']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (newAccountMaltainvest != null) {
      result['new_account_maltainvest'] = newAccountMaltainvest.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  NewAccountMaltainvestReceive copyWith({
    NewAccountMaltainvest newAccountMaltainvest,
  }) =>
      NewAccountMaltainvestReceive(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
      );
}
/// New account maltainvest model class
abstract class NewAccountMaltainvestModel {
  /// Initializes
  NewAccountMaltainvestModel({
    @required this.clientId,
    @required this.landingCompany,
    @required this.landingCompanyShort,
    @required this.oauthToken,
  });

  /// Client ID of new `maltainvest` account
  final String clientId;

  /// Landing company full name
  final String landingCompany;

  /// Landing company shortcode
  final String landingCompanyShort;

  /// OAuth token for client's login session
  final String oauthToken;
}

/// New account maltainvest class
class NewAccountMaltainvest extends NewAccountMaltainvestModel {
  /// Initializes
  NewAccountMaltainvest({
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
  factory NewAccountMaltainvest.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvest(
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
  NewAccountMaltainvest copyWith({
    String clientId,
    String landingCompany,
    String landingCompanyShort,
    String oauthToken,
  }) =>
      NewAccountMaltainvest(
        clientId: clientId ?? this.clientId,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        oauthToken: oauthToken ?? this.oauthToken,
      );
}
