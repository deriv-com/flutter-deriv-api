// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/logout_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/logout_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Logout response model class.
abstract class LogoutResponseModel extends Equatable {
  /// Initializes Logout response model class .
  const LogoutResponseModel({
    this.logout,
  });

  /// The result of logout request which is 1
  final int? logout;
}

/// Logout response class.
class LogoutResponse extends LogoutResponseModel {
  /// Initializes Logout response class.
  const LogoutResponse({
    int? logout,
  }) : super(
          logout: logout,
        );

  /// Creates an instance from JSON.
  factory LogoutResponse.fromJson(
    dynamic logoutJson,
  ) =>
      LogoutResponse(
        logout: logoutJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['logout'] = logout;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Logs out from the web-socket's session.
  ///
  /// For parameters information refer to [LogoutRequest].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<LogoutResponse> logoutMethod([
    LogoutRequest? request,
  ]) async {
    final LogoutReceive response = await _api.call(
      request: request ?? const LogoutRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AuthorizeException(baseExceptionModel: baseExceptionModel),
    );

    return LogoutResponse.fromJson(response.logout);
  }

  /// Creates a copy of instance with given parameters.
  LogoutResponse copyWith({
    int? logout,
  }) =>
      LogoutResponse(
        logout: logout ?? this.logout,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
