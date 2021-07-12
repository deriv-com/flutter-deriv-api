// TODO(unknown): Create methods file in lib/basic_api/generated/methods for this file.
 import '../../helpers/helpers.dart';

/// Trading platform investor password reset response model class.
abstract class TradingPlatformInvestorPasswordResetResponseModel {
  /// Initializes.
  TradingPlatformInvestorPasswordResetResponseModel({
    this.tradingPlatformPasswordReset,
  });

  /// If set to `true`, the investor password has been reset.
  final bool? tradingPlatformPasswordReset;
}

/// Trading platform investor password reset response class.
class TradingPlatformInvestorPasswordResetResponse
    extends TradingPlatformInvestorPasswordResetResponseModel {
  /// Initializes
  TradingPlatformInvestorPasswordResetResponse({
    bool? tradingPlatformPasswordReset,
  }) : super(
          tradingPlatformPasswordReset: tradingPlatformPasswordReset,
        );

  /// Creates an instance from JSON
  factory TradingPlatformInvestorPasswordResetResponse.fromJson(
    dynamic tradingPlatformPasswordResetJson,
  ) =>
      TradingPlatformInvestorPasswordResetResponse(
        tradingPlatformPasswordReset: getBool(tradingPlatformPasswordResetJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_password_reset'] = tradingPlatformPasswordReset;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformInvestorPasswordResetResponse copyWith({
    bool? tradingPlatformPasswordReset,
  }) =>
      TradingPlatformInvestorPasswordResetResponse(
        tradingPlatformPasswordReset:
            tradingPlatformPasswordReset ?? this.tradingPlatformPasswordReset,
      );
}
