// TODO(unknown): Create methods file in lib/basic_api/generated/methods for this file.
 import '../../helpers/helpers.dart';

/// Trading platform password reset response model class.
abstract class TradingPlatformPasswordResetResponseModel {
  /// Initializes.
  TradingPlatformPasswordResetResponseModel({
    this.tradingPlatformPasswordReset,
  });

  /// If set to `true`, the password has been reset.
  final bool? tradingPlatformPasswordReset;
}

/// Trading platform password reset response class.
class TradingPlatformPasswordResetResponse
    extends TradingPlatformPasswordResetResponseModel {
  /// Initializes
  TradingPlatformPasswordResetResponse({
    bool? tradingPlatformPasswordReset,
  }) : super(
          tradingPlatformPasswordReset: tradingPlatformPasswordReset,
        );

  /// Creates an instance from JSON
  factory TradingPlatformPasswordResetResponse.fromJson(
    dynamic tradingPlatformPasswordResetJson,
  ) =>
      TradingPlatformPasswordResetResponse(
        tradingPlatformPasswordReset: getBool(tradingPlatformPasswordResetJson),
      );

  /// Converts an instance to JSON
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
