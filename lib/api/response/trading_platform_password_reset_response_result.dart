// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';    
/// Trading platform password reset response model class.
abstract class TradingPlatformPasswordResetResponseModel {
  /// Initializes Trading platform password reset response model class .
  const TradingPlatformPasswordResetResponseModel({
    this.tradingPlatformPasswordReset,
  });

  /// If set to `true`, the password has been reset.
  final bool? tradingPlatformPasswordReset;
}

/// Trading platform password reset response class.
class TradingPlatformPasswordResetResponse
    extends TradingPlatformPasswordResetResponseModel {
  /// Initializes Trading platform password reset response class.
  const TradingPlatformPasswordResetResponse({
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
