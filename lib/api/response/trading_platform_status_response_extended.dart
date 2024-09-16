import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/trading_platform_status_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_status_receive.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_status_send.dart';

/// The extended version of the [TradingPlatformPasswordResetResponse] class to implement
/// the API call methods.
class TradingPlatformStatusResponseExtended
    extends TradingPlatformStatusResponse {
  /// Initializes Trading platform status response class.
  TradingPlatformStatusResponseExtended({required super.tradingPlatformStatus});

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// It calls the API to get the status.
  static Future<TradingPlatformStatusResponse> getStatus({
    required TradingPlatformStatusRequest request,
  }) async {
    final TradingPlatformStatusReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformStatusResponse.fromJson(response);
  }
}
