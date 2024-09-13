// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_status_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_status_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

import '../../services/connection/api_manager/base_api.dart';
import '../exceptions/exceptions.dart';

/// Trading platform status response model class.
abstract class TradingPlatformStatusResponseModel {
  /// Initializes Trading platform status response model class .
  const TradingPlatformStatusResponseModel({
    required this.tradingPlatformStatus,
  });

  /// Availability status of the trading platforms
  final List<dynamic> tradingPlatformStatus;
}

/// Trading platform status response class.
class TradingPlatformStatusResponse extends TradingPlatformStatusResponseModel {
  /// Initializes Trading platform status response class.
  const TradingPlatformStatusResponse({
    required super.tradingPlatformStatus,
  });

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Trading Platform: New Account (request).
  ///
  /// This call gets the status of external trading accounts, either demo or real money.
  /// For parameters information refer to [TradingPlatformStatusRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<TradingPlatformStatusResponseModel> create(
    TradingPlatformStatusRequest request,
  ) async {
    final TradingPlatformStatusReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformStatusResponse.fromJson(
      response.tradingPlatformStatus,
    );
  }

  /// Creates an instance from JSON.
  factory TradingPlatformStatusResponse.fromJson(
    dynamic tradingPlatformStatusJson,
  ) =>
      TradingPlatformStatusResponse(
        tradingPlatformStatus: List<dynamic>.from(
          tradingPlatformStatusJson.map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['trading_platform_status'] = tradingPlatformStatus
        .map<dynamic>(
          (dynamic item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformStatusResponse copyWith({
    List<dynamic>? tradingPlatformStatus,
  }) =>
      TradingPlatformStatusResponse(
        tradingPlatformStatus:
            tradingPlatformStatus ?? this.tradingPlatformStatus,
      );
}
