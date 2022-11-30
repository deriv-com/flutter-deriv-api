// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Trading platform deposit response model class.
abstract class TradingPlatformDepositResponseModel {
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Trading Platform: Deposit.
  ///
  /// Information about deposit transaction, or status of demo account top up.
  /// For parameters information refer to [TradingPlatformDepositRequest].
  /// Throws a [TradingPlatformException] if API response contains an error.
  static Future<TradingPlatformDepositResponse> deposit(
    TradingPlatformDepositRequest request,
  ) async {
    final TradingPlatformDepositReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TradingPlatformException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformDepositResponse.fromJson(
      response.tradingPlatformDeposit,
    );
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformDepositResponse copyWith({
    Map<String, dynamic>? tradingPlatformDeposit,
  }) =>
      TradingPlatformDepositResponse(
        tradingPlatformDeposit:
            tradingPlatformDeposit ?? this.tradingPlatformDeposit,
      );
}
