import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';
import 'package:flutter_deriv_api/api/user/models/trading_platform_password_reset_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Trading platform reset password class
class TradingPlatformPasswordReset extends TradingPlatformPasswordResetModel {
  /// Initializes
  TradingPlatformPasswordReset({
    required bool tradingPlatformPasswordReset,
  }) : super(
          tradingPlatformPasswordReset: tradingPlatformPasswordReset,
        );

  /// Creates an instance from JSON
  factory TradingPlatformPasswordReset.fromResponse(
          TradingPlatformPasswordResetResponse response) =>
      TradingPlatformPasswordReset(
        tradingPlatformPasswordReset:
            response.tradingPlatformPasswordReset ?? false,
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Reset the password of a Trading Platform Account.
  static Future<TradingPlatformPasswordReset> changePassword(
    TradingPlatformPasswordResetRequest request,
  ) async {
    final TradingPlatformPasswordResetResponse? response = await _api!
        .call<TradingPlatformPasswordResetResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          UserException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformPasswordReset.fromResponse(response!);
  }

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['trading_platform_password_reset'] = tradingPlatformPasswordReset;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TradingPlatformPasswordReset copyWith({
    bool? tradingPlatformPasswordReset,
  }) =>
      TradingPlatformPasswordReset(
        tradingPlatformPasswordReset:
            tradingPlatformPasswordReset ?? this.tradingPlatformPasswordReset,
      );
}
