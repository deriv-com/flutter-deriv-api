import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_stats_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/exceptions/p2p_advertiser_stats_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P advertiser stats class
class P2PAdvertiserStats extends P2PAdvertiserStatsModel {
  /// Initializes
  P2PAdvertiserStats({
    int buyOrdersCount,
    int cancelTimeAvg,
    double completionRate,
    int releaseTimeAvg,
    int sellOrdersCount,
    int totalOrdersCount,
  }) : super(
          buyOrdersCount: buyOrdersCount,
          cancelTimeAvg: cancelTimeAvg,
          completionRate: completionRate,
          releaseTimeAvg: releaseTimeAvg,
          sellOrdersCount: sellOrdersCount,
          totalOrdersCount: totalOrdersCount,
        );

  /// Generates an instance from JSON
  factory P2PAdvertiserStats.fromJson(Map<String, dynamic> json) =>
      P2PAdvertiserStats(
        buyOrdersCount: json['buy_orders_count'],
        cancelTimeAvg: json['cancel_time_avg'],
        completionRate: json['completion_rate']?.toDouble(),
        releaseTimeAvg: json['release_time_avg'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  P2PAdvertiserStats copyWith({
    int buyOrdersCount,
    int cancelTimeAvg,
    double completionRate,
    int releaseTimeAvg,
    int sellOrdersCount,
    int totalOrdersCount,
  }) =>
      P2PAdvertiserStats(
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        completionRate: completionRate ?? this.completionRate,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
      );

  /// Returns historical trade statistics of a P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserStatsRequest].
  /// Throws a [P2PAdvertiserStatsException] if API response contains an error
  static Future<P2PAdvertiserStats> fetchAdvertiserStats(
    P2pAdvertiserStatsRequest request,
  ) async {
    final P2pAdvertiserStatsResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          P2PAdvertiserStatsException(code: code, message: message),
    );

    return P2PAdvertiserStats.fromJson(response.p2pAdvertiserStats);
  }
}
