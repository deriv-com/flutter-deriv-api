// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_check_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_check_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 password check response model class.
abstract class Mt5PasswordCheckResponseModel {
  /// Initializes Mt5 password check response model class .
  const Mt5PasswordCheckResponseModel({
    this.mt5PasswordCheck,
  });

  /// `1` on success
  final int? mt5PasswordCheck;
}

/// Mt5 password check response class.
class Mt5PasswordCheckResponse extends Mt5PasswordCheckResponseModel {
  /// Initializes Mt5 password check response class.
  const Mt5PasswordCheckResponse({
    super.mt5PasswordCheck,
  });

  /// Creates an instance from JSON.
  factory Mt5PasswordCheckResponse.fromJson(
    dynamic mt5PasswordCheckJson,
  ) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheckJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_password_check'] = mt5PasswordCheck;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Validates the main password for the MT5 user.
  ///
  /// For parameters information refer to [Mt5PasswordCheckRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<Mt5PasswordCheckResponse> checkPassword(
      Mt5PasswordCheckRequest request) async {
    final Mt5PasswordCheckReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return Mt5PasswordCheckResponse.fromJson(response.mt5PasswordCheck);
  }

  /// Creates a copy of instance with given parameters.
  Mt5PasswordCheckResponse copyWith({
    int? mt5PasswordCheck,
  }) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
      );
}
