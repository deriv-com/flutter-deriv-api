import 'package:flutter_deriv_api/api/app/models/new_account_real_model.dart';
import 'package:flutter_deriv_api/api/app/new_account/exceptions/new_account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// New account real class
class NewAccountReal extends NewAccountRealModel {
  /// Initializes
  NewAccountReal({
    String? clientId,
    String? landingCompany,
    String? landingCompanyShort,
    String? oauthToken,
  }) : super(
          clientId: clientId,
          landingCompany: landingCompany,
          landingCompanyShort: landingCompanyShort,
          oauthToken: oauthToken,
        );

  /// Generates an instance from JSON
  factory NewAccountReal.fromJson(Map<String, dynamic> json) => NewAccountReal(
        clientId: json['client_id'],
        landingCompany: json['landing_company'],
        landingCompanyShort: json['landing_company_short'],
        oauthToken: json['oauth_token'],
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  NewAccountReal copyWith({
    String? clientId,
    String? landingCompany,
    String? landingCompanyShort,
    String? oauthToken,
  }) =>
      NewAccountReal(
        clientId: clientId ?? this.clientId,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        oauthToken: oauthToken ?? this.oauthToken,
      );

  /// Opens a new real account.
  ///
  /// For parameters information refer to [NewAccountRealRequest].
  /// Throws a [NewAccountException] ifAP
  static Future<NewAccountReal> openNewRealAccount(
    NewAccountRealRequest request,
  ) async {
    final NewAccountRealResponse response = await _api!.call<NewAccountRealResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          NewAccountException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountReal.fromJson(response.newAccountReal);
  }
}
