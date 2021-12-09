import 'package:flutter_deriv_api/api/app/models/new_account_virtual_model.dart';
import 'package:flutter_deriv_api/api/app/new_account/exceptions/new_account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// New account virtual class
class NewAccountVirtual extends NewAccountVirtualModel {
  /// Initializes
  NewAccountVirtual({
    double? balance,
    String? clientId,
    String? currency,
    String? email,
    String? oauthToken,
    String? refreshToken,
  }) : super(
          balance: balance,
          clientId: clientId,
          currency: currency,
          email: email,
          oauthToken: oauthToken,
          refreshToken: refreshToken,
        );

  /// Generates an instance from JSON
  factory NewAccountVirtual.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtual(
        balance: json['balance']?.toDouble(),
        clientId: json['client_id'],
        currency: json['currency'],
        email: json['email'],
        oauthToken: json['oauth_token'],
        refreshToken: json['refresh_token'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Generates a copy of instance with given parameters
  NewAccountVirtual copyWith({
    double? balance,
    String? clientId,
    String? currency,
    String? email,
    String? oauthToken,
    String? refreshToken,
  }) =>
      NewAccountVirtual(
        balance: balance ?? this.balance,
        clientId: clientId ?? this.clientId,
        currency: currency ?? this.currency,
        email: email ?? this.email,
        oauthToken: oauthToken ?? this.oauthToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  /// Opens a new virtual account.
  ///
  /// For parameters information refer to [NewAccountVirtualRequest].
  /// Throws a [NewAccountException] if API response contains an error
  static Future<NewAccountVirtual> openNewVirtualAccount(
    NewAccountVirtualRequest request,
  ) async {
    final NewAccountVirtualResponse response =
        await _api.call<NewAccountVirtualResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          NewAccountException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountVirtual.fromJson(response.newAccountVirtual!);
  }
}
