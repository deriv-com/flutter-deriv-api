// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform investor password change response model class.
abstract class TradingPlatformInvestorPasswordChangeResponseModel {
  /// Initializes Trading platform investor password change response model class .
  const TradingPlatformInvestorPasswordChangeResponseModel({
    this.tradingPlatformPasswordChange,
  });

  /// If set to `true`, the password has been updated.
  final bool? tradingPlatformPasswordChange;
}

/// Trading platform investor password change response class.
class TradingPlatformInvestorPasswordChangeResponse
    extends TradingPlatformInvestorPasswordChangeResponseModel {
  /// Initializes Trading platform investor password change response class.
  const TradingPlatformInvestorPasswordChangeResponse({
    bool? tradingPlatformPasswordChange,
  }) : super(
          tradingPlatformPasswordChange: tradingPlatformPasswordChange,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformInvestorPasswordChangeResponse.fromJson(
    dynamic tradingPlatformPasswordChangeJson,
  ) =>
      TradingPlatformInvestorPasswordChangeResponse(
        tradingPlatformPasswordChange:
            getBool(tradingPlatformPasswordChangeJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_password_change'] =
        tradingPlatformPasswordChange;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformInvestorPasswordChangeResponse copyWith({
    bool? tradingPlatformPasswordChange,
  }) =>
      TradingPlatformInvestorPasswordChangeResponse(
        tradingPlatformPasswordChange:
            tradingPlatformPasswordChange ?? this.tradingPlatformPasswordChange,
      );
}
