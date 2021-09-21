import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
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
    DateTime? epoch,
    String? id,
    int? pipeSize,
    String? symbol,
    SubscriptionModel? subscriptionInformation,
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
    Map<String, dynamic>? subscriptionJson,
  }) =>
      OHLC(
        close: json['close'] is String
            ? double.tryParse(json['close'])
            : json['close']?.toDouble(),
        granularity: json['granularity'],
        high: json['high'] is String
            ? double.tryParse(json['high'])
            : json['high']?.toDouble(),
        low: json['low'] is String
            ? double.tryParse(json['low'])
            : json['low']?.toDouble(),
        open: json['open'] is String
            ? double.tryParse(json['open'])
            : json['open']?.toDouble(),
        openTime: getDateTime(json['open_time']),
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipeSize: json['pip_size'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Close
  final double? close;

  /// Granularity
  final int? granularity;

  /// High
  final double? high;

  /// Low
  final double? low;

  /// Open
  final double? open;

  /// Open time
  final DateTime? openTime;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Unsubscribes all OHLC.
  ///
  /// Throws a [TickException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOHLC() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.candles);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters
  @override
  OHLC copyWith({
    double? close,
    int? granularity,
    double? high,
    double? low,
    double? open,
    DateTime? openTime,
    DateTime? epoch,
    String? id,
    int? pipSize,
    String? symbol,
    SubscriptionModel? subscriptionInformation,
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
