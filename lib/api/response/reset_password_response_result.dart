// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/reset_password_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/reset_password_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Reset password response model class.
abstract class ResetPasswordResponseModel extends Equatable {
  /// Initializes Reset password response model class .
  const ResetPasswordResponseModel({
    this.resetPassword,
  });

  /// `true`: password reset success, `false`: password reset failure
  final bool? resetPassword;
}

/// Reset password response class.
class ResetPasswordResponse extends ResetPasswordResponseModel {
  /// Initializes Reset password response class.
  const ResetPasswordResponse({
    bool? resetPassword,
  }) : super(
          resetPassword: resetPassword,
        );

  /// Creates an instance from JSON.
  factory ResetPasswordResponse.fromJson(
    dynamic resetPasswordJson,
  ) =>
      ResetPasswordResponse(
        resetPassword: getBool(resetPasswordJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['reset_password'] = resetPassword;

    return resultMap;
  }

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Reset the password of User.
  static Future<ResetPasswordResponse> reset(
    ResetPasswordRequest request,
  ) async {
    final ResetPasswordReceive? response =
        await _api!.call<ResetPasswordReceive>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
    );

    return ResetPasswordResponse.fromJson(response?.resetPassword);
  }

  /// Creates a copy of instance with given parameters.
  ResetPasswordResponse copyWith({
    bool? resetPassword,
  }) =>
      ResetPasswordResponse(
        resetPassword: resetPassword ?? this.resetPassword,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
