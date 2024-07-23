import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/trading_platform_password_reset_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_password_reset_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_password_reset_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [TradingPlatformPasswordResetResponse] class to implement
/// the API call methods.
class TradingPlatformPasswordResetResponseExtended
    extends TradingPlatformPasswordResetResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// It calls the API to reset the password.
  static Future<TradingPlatformPasswordResetResponse> resetPassword({
    required TradingPlatformPasswordResetRequest request,
  }) async {
    final TradingPlatformPasswordResetReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformPasswordResetResponse.fromJson(
        response.tradingPlatformPasswordReset);
  }
}
