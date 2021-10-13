// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';


/// New account maltainvest response model class.
abstract class NewAccountMaltainvestResponseModel extends Equatable {
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
    NewAccountMaltainvest? newAccountMaltainvest,
  }) : super(
          newAccountMaltainvest: newAccountMaltainvest,
        );

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

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
/// New account maltainvest model class.
abstract class NewAccountMaltainvestModel extends Equatable {
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
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) =>
      NewAccountMaltainvest(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
