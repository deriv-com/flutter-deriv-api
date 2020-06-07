import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/tick_exception.dart';
import 'tick_base.dart';

/// OHLC class, represents price of the symbol over time.
class OHLC extends TickBase {
  /// Initializes
  OHLC({
    this.close,
    this.granularity,
    this.high,
    this.low,
    this.open,
    this.openTime,
    DateTime epoch,
    String id,
    int pipeSize,
    String symbol,
    SubscriptionModel subscriptionInformation,
  }) : super(
          epoch: epoch,
          id: id,
          symbol: symbol,
          pipSize: pipeSize,
          subscriptionInformation: subscriptionInformation,
        );

  /// Creates an instance from JSON
  factory OHLC.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      OHLC(
        close: json['close'],
        granularity: json['granularity'],
        high: json['high'],
        low: json['low'],
        open: json['open'],
        openTime: getDateTime(json['openTime']),
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipeSize: json['pipeSize'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Close
  final String close;

  /// Granularity
  final int granularity;

  /// High
  final String high;

  /// Low
  final String low;

  /// Open
  final String open;

  /// Open time
  final DateTime openTime;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Unsubscribes all OHLC.
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllOHLC() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.candles);

    checkException(
      response: response,
      exceptionCreator: (String message) => TickException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Creates a copy of instance with given parameters
  @override
  OHLC copyWith({
    String close,
    int granularity,
    String high,
    String low,
    String open,
    DateTime openTime,
    DateTime epoch,
    String id,
    int pipSize,
    String symbol,
    SubscriptionModel subscriptionInformation,
  }) =>
      OHLC(
        close: close ?? this.close,
        granularity: granularity ?? this.granularity,
        high: high ?? this.high,
        low: low ?? this.low,
        open: open ?? this.open,
        openTime: openTime ?? this.openTime,
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipeSize: pipSize ?? this.pipSize,
        symbol: symbol ?? this.symbol,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
