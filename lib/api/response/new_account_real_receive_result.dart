// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_real_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_real_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// New account real response model class.
abstract class NewAccountRealResponseModel {
  /// Initializes New account real response model class .
  NewAccountRealResponseModel({
    this.newAccountReal,
  });

  /// New real money account details
  final NewAccountReal? newAccountReal;
}

/// New account real response class.
class NewAccountRealResponse extends NewAccountRealResponseModel {
  /// Initializes New account real response class.
  NewAccountRealResponse({
    NewAccountReal? newAccountReal,
  }) : super(
          newAccountReal: newAccountReal,
        );

  /// Creates an instance from JSON.
  factory NewAccountRealResponse.fromJson(
    dynamic newAccountRealJson,
  ) =>
      NewAccountRealResponse(
        newAccountReal: newAccountRealJson == null
            ? null
            : NewAccountReal.fromJson(newAccountRealJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (newAccountReal != null) {
      resultMap['new_account_real'] = newAccountReal!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Opens a new real account.
  ///
  /// For parameters information refer to [NewAccountRealRequest].
  /// Throws a [NewAccountException] ifAP
  static Future<NewAccountRealResponse> openNewRealAccount(
    NewAccountRealRequest request,
  ) async {
    final NewAccountRealReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          NewAccountException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountRealResponse.fromJson(response.newAccountReal);
  }

  /// Creates a copy of instance with given parameters.
  NewAccountRealResponse copyWith({
    NewAccountReal? newAccountReal,
  }) =>
      NewAccountRealResponse(
        newAccountReal: newAccountReal ?? this.newAccountReal,
      );
}
/// New account real model class.
abstract class NewAccountRealModel {
  /// Initializes New account real model class .
  NewAccountRealModel({
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.landingCompanyShort,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of new real money account
  final String clientId;

  /// Landing company shortcode
  final String? landingCompanyShort;
}

/// New account real class.
class NewAccountReal extends NewAccountRealModel {
  /// Initializes New account real class.
  NewAccountReal({
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

  /// Creates an instance from JSON.
  factory NewAccountReal.fromJson(Map<String, dynamic> json) => NewAccountReal(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        landingCompanyShort: json['landing_company_short'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['landing_company_short'] = landingCompanyShort;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountReal copyWith({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? landingCompanyShort,
  }) =>
      NewAccountReal(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
      );
}
