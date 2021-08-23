import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';
import 'package:flutter_deriv_api/api/user/models/reset_pass_model.dart';
import 'package:flutter_deriv_api/basic_api/manually/reset_password_send.dart';
import 'package:flutter_deriv_api/basic_api/manually/reset_password_receive.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Reset password class
class ResetPassword extends ResetPasswordModel {
  /// Initializes
  ResetPassword({
    required bool resetPassword,
  }) : super(
          resetPassword: resetPassword,
        );

  /// Creates an instance from JSON
  factory ResetPassword.fromResponse(ResetPasswordResponse response) =>
      ResetPassword(
        resetPassword: response.resetPassword ?? false,
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Reset the password of User.
  static Future<ResetPassword> reset(
    ResetPasswordRequest request,
  ) async {
    final ResetPasswordResponse? response =
        await _api!.call<ResetPasswordResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
    );

    return ResetPassword.fromResponse(response!);
  }

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['reset_password'] = resetPassword;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ResetPassword copyWith({
    bool? resetPassword,
  }) =>
      ResetPassword(
        resetPassword: resetPassword ?? this.resetPassword,
      );
}