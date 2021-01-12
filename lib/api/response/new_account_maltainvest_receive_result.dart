import 'package:meta/meta.dart';

/// New account maltainvest response model class
abstract class NewAccountMaltainvestResponseModel {
  /// Initializes
  NewAccountMaltainvestResponseModel({
    @required this.newAccountMaltainvest,
  });

  /// New `maltainvest` account details
  final NewAccountMaltainvest newAccountMaltainvest;
}

/// New account maltainvest response class
class NewAccountMaltainvestResponse extends NewAccountMaltainvestResponseModel {
  /// Initializes
  NewAccountMaltainvestResponse({
    @required NewAccountMaltainvest newAccountMaltainvest,
  }) : super(
          newAccountMaltainvest: newAccountMaltainvest,
        );

  /// Creates an instance from JSON
  factory NewAccountMaltainvestResponse.fromJson(
    dynamic newAccountMaltainvestJson,
  ) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest: newAccountMaltainvestJson == null
            ? null
            : NewAccountMaltainvest.fromJson(newAccountMaltainvestJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountMaltainvest != null) {
      resultMap['new_account_maltainvest'] = newAccountMaltainvest.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  NewAccountMaltainvestResponse copyWith({
    NewAccountMaltainvest newAccountMaltainvest,
  }) =>
      NewAccountMaltainvestResponse(
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['landing_company_short'] = landingCompanyShort;
    resultMap['oauth_token'] = oauthToken;

    return resultMap;
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
