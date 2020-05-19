import 'package:flutter_deriv_api/api/common/forget/exceptions/forget_exception.dart';
import 'package:flutter_deriv_api/api/common/models/forget_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forget class
class Forget extends ForgetModel {
  /// Initializes
  Forget({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory Forget.fromResponse(ForgetResponse response) =>
      Forget(succeeded: getBool(response.forget));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  Forget copyWith({
    bool succeeded,
  }) =>
      Forget(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Immediately cancels the real-time stream of messages with a specific id.
  ///
  /// For parameters information refer to [ForgetRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<Forget> forget(
    ForgetRequest request,
  ) async {
    final ForgetResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ForgetException(message: response.error['message']);
    }

    return Forget.fromResponse(response);
  }
}
