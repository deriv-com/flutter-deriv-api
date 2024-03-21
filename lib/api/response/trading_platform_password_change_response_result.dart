// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform password change response model class.
abstract class TradingPlatformPasswordChangeResponseModel {
  /// Initializes Trading platform password change response model class .
  const TradingPlatformPasswordChangeResponseModel({
    this.tradingPlatformPasswordChange,
  });

  /// If set to `true`, the password has been updated.
  final bool? tradingPlatformPasswordChange;
}

/// Trading platform password change response class.
class TradingPlatformPasswordChangeResponse
    extends TradingPlatformPasswordChangeResponseModel {
  /// Initializes Trading platform password change response class.
  const TradingPlatformPasswordChangeResponse({
    super.tradingPlatformPasswordChange,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformPasswordChangeResponse.fromJson(
    dynamic tradingPlatformPasswordChangeJson,
  ) =>
      TradingPlatformPasswordChangeResponse(
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
  TradingPlatformPasswordChangeResponse copyWith({
    bool? tradingPlatformPasswordChange,
  }) =>
      TradingPlatformPasswordChangeResponse(
        tradingPlatformPasswordChange:
            tradingPlatformPasswordChange ?? this.tradingPlatformPasswordChange,
      );
}
