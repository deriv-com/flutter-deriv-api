// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_change_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_change_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Mt5 password change response model class.
abstract class Mt5PasswordChangeResponseModel extends Equatable {
  /// Initializes Mt5 password change response model class .
  const Mt5PasswordChangeResponseModel({
    this.mt5PasswordChange,
  });

  /// `1` on success
  final int? mt5PasswordChange;
}

/// Mt5 password change response class.
class Mt5PasswordChangeResponse extends Mt5PasswordChangeResponseModel {
  /// Initializes Mt5 password change response class.
  const Mt5PasswordChangeResponse({
    int? mt5PasswordChange,
  }) : super(
          mt5PasswordChange: mt5PasswordChange,
        );

  /// Creates an instance from JSON.
  factory Mt5PasswordChangeResponse.fromJson(
    dynamic mt5PasswordChangeJson,
  ) =>
      Mt5PasswordChangeResponse(
        mt5PasswordChange: mt5PasswordChangeJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_password_change'] = mt5PasswordChange;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Changes the password of the MT5 account.
  ///
  /// For parameters information refer to [Mt5PasswordChangeRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5PasswordChangeResponse> changePassword(
    Mt5PasswordChangeRequest request,
  ) async {
    final Mt5PasswordChangeReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5PasswordChangeResponse.fromJson(response.mt5PasswordChange);
  }

  /// Creates a copy of instance with given parameters.
  Mt5PasswordChangeResponse copyWith({
    int? mt5PasswordChange,
  }) =>
      Mt5PasswordChangeResponse(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
