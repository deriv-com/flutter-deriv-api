import 'package:meta/meta.dart';

/// New account maltainvest response model class
abstract class NewAccountMaltainvestResponseModel {
  /// Initializes
  NewAccountMaltainvestResponseModel({
    this.newAccountMaltainvest,
  });

  /// New `maltainvest` account details
  final NewAccountMaltainvest? newAccountMaltainvest;
}

/// New account maltainvest response class
class NewAccountMaltainvestResponse extends NewAccountMaltainvestResponseModel {
  /// Initializes
  NewAccountMaltainvestResponse({
    NewAccountMaltainvest? newAccountMaltainvest,
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
      resultMap['new_account_maltainvest'] = newAccountMaltainvest!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  NewAccountMaltainvestResponse copyWith({
    NewAccountMaltainvest? newAccountMaltainvest,
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
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.landingCompanyShort,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of new `maltainvest` account
  final String clientId;

  /// Landing company shortcode
  final String? landingCompanyShort;
}

/// New account maltainvest class
class NewAccountMaltainvest extends NewAccountMaltainvestModel {
  /// Initializes
  NewAccountMaltainvest({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          oauthToken: oauthToken,
          landingCompanyShort: landingCompanyShort,
        );

  /// Creates an instance from JSON
  factory NewAccountMaltainvest.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvest(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        landingCompanyShort: json['landing_company_short'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['landing_company_short'] = landingCompanyShort;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  NewAccountMaltainvest copyWith({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
  }) =>
      NewAccountMaltainvest(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
      );
}
