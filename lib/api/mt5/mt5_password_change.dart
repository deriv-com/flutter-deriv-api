import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_password_change_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 password change class
class MT5PasswordChange extends MT5PasswordChangeModel {
  /// Initializes
  MT5PasswordChange({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory MT5PasswordChange.fromResponse(Mt5PasswordChangeResponse response) =>
      MT5PasswordChange(succeeded: getBool(response.mt5PasswordChange));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5PasswordChange copyWith({
    bool succeeded,
  }) =>
      MT5PasswordChange(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Change password of the MT5 account.
  /// For parameters information refer to [Mt5PasswordChangeRequest].
  static Future<MT5PasswordChange> changePassword(
    Mt5PasswordChangeRequest request,
  ) async {
    final Mt5PasswordChangeResponse response =
        await _api.call(request: request);

    if (response.error != null) {
      throw MT5Exception(message: response.error['message']);
    }

    return MT5PasswordChange.fromResponse(response);
  }
}
