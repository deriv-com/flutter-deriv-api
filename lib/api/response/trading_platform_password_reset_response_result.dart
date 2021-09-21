// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/helpers/helpers.dart';    

/// Trading platform password reset response model class.
abstract class TradingPlatformPasswordResetResponseModel {
  /// Initializes Trading platform password reset response model class .
  TradingPlatformPasswordResetResponseModel({
    this.tradingPlatformPasswordReset,
  });

  /// If set to `true`, the password has been reset.
  final bool? tradingPlatformPasswordReset;
}

/// Trading platform password reset response class.
class TradingPlatformPasswordResetResponse
    extends TradingPlatformPasswordResetResponseModel {
  /// Initializes Trading platform password reset response class.
  TradingPlatformPasswordResetResponse({
    bool? tradingPlatformPasswordReset,
  }) : super(
          tradingPlatformPasswordReset: tradingPlatformPasswordReset,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformPasswordResetResponse.fromJson(
    dynamic tradingPlatformPasswordResetJson,
  ) =>
      TradingPlatformPasswordResetResponse(
        tradingPlatformPasswordReset: getBool(tradingPlatformPasswordResetJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_password_reset'] = tradingPlatformPasswordReset;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformPasswordResetResponse copyWith({
    bool? tradingPlatformPasswordReset,
  }) =>
      TradingPlatformPasswordResetResponse(
        tradingPlatformPasswordReset:
            tradingPlatformPasswordReset ?? this.tradingPlatformPasswordReset,
      );
}
