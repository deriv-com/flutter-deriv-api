// ignore_for_file: prefer_single_quotes

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_check_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_check_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Mt5 password check response model class.
abstract class Mt5PasswordCheckResponseModel extends Equatable {
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
    int? mt5PasswordCheck,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Validates the main password for the MT5 user.
  ///
  /// For parameters information refer to [Mt5PasswordCheckRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5PasswordCheckResponse> checkPassword(
      Mt5PasswordCheckRequest request) async {
    final Mt5PasswordCheckReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
