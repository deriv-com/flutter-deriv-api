// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/revoke_oauth_app_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/revoke_oauth_app_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Revoke oauth app response model class.
abstract class RevokeOauthAppResponseModel {
  /// Initializes Revoke oauth app response model class .
  const RevokeOauthAppResponseModel({
    this.revokeOauthApp,
  });

  /// `1` on success
  final int? revokeOauthApp;
}

/// Revoke oauth app response class.
class RevokeOauthAppResponse extends RevokeOauthAppResponseModel {
  /// Initializes Revoke oauth app response class.
  const RevokeOauthAppResponse({
    int? revokeOauthApp,
  }) : super(
          revokeOauthApp: revokeOauthApp,
        );

  /// Creates an instance from JSON.
  factory RevokeOauthAppResponse.fromJson(
    dynamic revokeOauthAppJson,
  ) =>
      RevokeOauthAppResponse(
        revokeOauthApp: revokeOauthAppJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['revoke_oauth_app'] = revokeOauthApp;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Revokes access of a particular app.
  ///
  /// For parameters information refer to [RevokeOauthAppRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<RevokeOauthAppResponse> revokeOauthApplication(
    RevokeOauthAppRequest request,
  ) async {
    final RevokeOauthAppReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return RevokeOauthAppResponse.fromJson(response.revokeOauthApp);
  }

  /// Creates a copy of instance with given parameters.
  RevokeOauthAppResponse copyWith({
    int? revokeOauthApp,
  }) =>
      RevokeOauthAppResponse(
        revokeOauthApp: revokeOauthApp ?? this.revokeOauthApp,
      );
}
