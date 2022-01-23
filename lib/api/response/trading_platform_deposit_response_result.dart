// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform deposit response model class.
abstract class TradingPlatformDepositResponseModel extends Equatable {
  /// Initializes Trading platform deposit response model class .
  const TradingPlatformDepositResponseModel({
    this.tradingPlatformDeposit,
  });

  /// Information about deposit transaction, or status of demo account top up.
  final Map<String, dynamic>? tradingPlatformDeposit;
}

/// Trading platform deposit response class.
class TradingPlatformDepositResponse
    extends TradingPlatformDepositResponseModel {
  /// Initializes Trading platform deposit response class.
  const TradingPlatformDepositResponse({
    Map<String, dynamic>? tradingPlatformDeposit,
  }) : super(
          tradingPlatformDeposit: tradingPlatformDeposit,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformDepositResponse.fromJson(
    dynamic tradingPlatformDepositJson,
  ) =>
      TradingPlatformDepositResponse(
        tradingPlatformDeposit: tradingPlatformDepositJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_deposit'] = tradingPlatformDeposit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformDepositResponse copyWith({
    Map<String, dynamic>? tradingPlatformDeposit,
  }) =>
      TradingPlatformDepositResponse(
        tradingPlatformDeposit:
            tradingPlatformDeposit ?? this.tradingPlatformDeposit,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
