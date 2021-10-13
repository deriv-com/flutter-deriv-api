// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_real_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/new_account_real_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// New account real response model class.
abstract class NewAccountRealResponseModel extends Equatable {
  /// Initializes New account real response model class .
  const NewAccountRealResponseModel({
    this.newAccountReal,
  });

  /// New real money account details
  final NewAccountReal? newAccountReal;
}

/// New account real response class.
class NewAccountRealResponse extends NewAccountRealResponseModel {
  /// Initializes New account real response class.
  const NewAccountRealResponse({
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// New account real model class.
abstract class NewAccountRealModel extends Equatable {
  /// Initializes New account real model class .
  const NewAccountRealModel({
    required this.oauthToken,
    required this.landingCompany,
    required this.clientId,
    this.currency,
    this.landingCompanyShort,
    this.landingCompanyShortcode,
  });

  /// OAuth token for client's login session
  final String oauthToken;

  /// Landing company full name
  final String landingCompany;

  /// Client ID of new real money account
  final String clientId;

  /// Currency of an account
  final String? currency;

  /// Landing company shortcode
  final String? landingCompanyShort;

  /// Landing company shortcode
  final String? landingCompanyShortcode;
}

/// New account real class.
class NewAccountReal extends NewAccountRealModel {
  /// Initializes New account real class.
  const NewAccountReal({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? currency,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          oauthToken: oauthToken,
          currency: currency,
          landingCompanyShort: landingCompanyShort,
          landingCompanyShortcode: landingCompanyShortcode,
        );

  /// Creates an instance from JSON.
  factory NewAccountReal.fromJson(Map<String, dynamic> json) => NewAccountReal(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        oauthToken: json['oauth_token'],
        currency: json['currency'],
        landingCompanyShort: json['landing_company_short'],
        landingCompanyShortcode: json['landing_company_shortcode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['client_id'] = clientId;
    resultMap['landing_company'] = landingCompany;
    resultMap['oauth_token'] = oauthToken;
    resultMap['currency'] = currency;
    resultMap['landing_company_short'] = landingCompanyShort;
    resultMap['landing_company_shortcode'] = landingCompanyShortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NewAccountReal copyWith({
    required String clientId,
    required String landingCompany,
    required String oauthToken,
    String? currency,
    String? landingCompanyShort,
    String? landingCompanyShortcode,
  }) =>
      NewAccountReal(
        clientId: clientId,
        landingCompany: landingCompany,
        oauthToken: oauthToken,
        currency: currency ?? this.currency,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        landingCompanyShortcode:
            landingCompanyShortcode ?? this.landingCompanyShortcode,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
