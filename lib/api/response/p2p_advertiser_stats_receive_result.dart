import 'package:meta/meta.dart';

import '../../basic_api/generated/p2p_advertiser_stats_receive.dart';
import '../../basic_api/generated/p2p_advertiser_stats_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// P2p advertiser stats response model class
abstract class P2pAdvertiserStatsResponseModel {
  /// Initializes
  P2pAdvertiserStatsResponseModel({
    @required this.p2pAdvertiserStats,
  });

  /// P2P advertiser statistics.
  final P2pAdvertiserStats p2pAdvertiserStats;
}

/// P2p advertiser stats response class
class P2pAdvertiserStatsResponse extends P2pAdvertiserStatsResponseModel {
  /// Initializes
  P2pAdvertiserStatsResponse({
    @required P2pAdvertiserStats p2pAdvertiserStats,
  }) : super(
          p2pAdvertiserStats: p2pAdvertiserStats,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStatsResponse.fromJson(
    dynamic p2pAdvertiserStatsJson,
  ) =>
      P2pAdvertiserStatsResponse(
        p2pAdvertiserStats: p2pAdvertiserStatsJson == null
            ? null
            : P2pAdvertiserStats.fromJson(p2pAdvertiserStatsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserStats != null) {
      resultMap['p2p_advertiser_stats'] = p2pAdvertiserStats.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Returns historical trade statistics of a P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserStatsRequest].
  /// Throws a [P2PAdvertiserStatsException] if API response contains an error
  static Future<P2pAdvertiserStatsResponse> fetchAdvertiserStats(
    P2pAdvertiserStatsSend request,
  ) async {
    final P2pAdvertiserStatsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertiserStatsException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserStatsResponse.fromJson(response.p2pAdvertiserStats);
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStatsResponse copyWith({
    P2pAdvertiserStats p2pAdvertiserStats,
  }) =>
      P2pAdvertiserStatsResponse(
        p2pAdvertiserStats: p2pAdvertiserStats ?? this.p2pAdvertiserStats,
      );
}
/// P2p advertiser stats model class
abstract class P2pAdvertiserStatsModel {
  /// Initializes
  P2pAdvertiserStatsModel({
    @required this.basicVerification,
    this.buyCompletionRate,
    @required this.buyOrdersCount,
    this.cancelTimeAvg,
    @required this.fullVerification,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    @required this.sellOrdersCount,
    this.totalCompletionRate,
    @required this.totalOrdersCount,
  });

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// The percentage of completed orders out of total orders as a buyer within the requested time period.
  final double buyCompletionRate;

  /// The number of buy order completed within the requested time period.
  final int buyOrdersCount;

  /// The average time taken to cancel orders as a buyer within the requested time period, in seconds.
  final int cancelTimeAvg;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// The average time taken to release funds as a seller within the requested time period, in seconds.
  final int releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the requested time period.
  final double sellCompletionRate;

  /// The number of bselluy order orders completed within the requested time period.
  final int sellOrdersCount;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double totalCompletionRate;

  /// The total number of orders created since advertiser registration.
  final int totalOrdersCount;
}

/// P2p advertiser stats class
class P2pAdvertiserStats extends P2pAdvertiserStatsModel {
  /// Initializes
  P2pAdvertiserStats({
    @required bool basicVerification,
    double buyCompletionRate,
    @required int buyOrdersCount,
    int cancelTimeAvg,
    @required bool fullVerification,
    int releaseTimeAvg,
    double sellCompletionRate,
    @required int sellOrdersCount,
    double totalCompletionRate,
    @required int totalOrdersCount,
  }) : super(
          basicVerification: basicVerification,
          buyCompletionRate: buyCompletionRate,
          buyOrdersCount: buyOrdersCount,
          cancelTimeAvg: cancelTimeAvg,
          fullVerification: fullVerification,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          sellOrdersCount: sellOrdersCount,
          totalCompletionRate: totalCompletionRate,
          totalOrdersCount: totalOrdersCount,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStats.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStats(
        basicVerification: getBool(json['basic_verification']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyOrdersCount: json['buy_orders_count'],
        cancelTimeAvg: json['cancel_time_avg'],
        fullVerification: getBool(json['full_verification']),
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        sellOrdersCount: json['sell_orders_count'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
        totalOrdersCount: json['total_orders_count'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['full_verification'] = fullVerification;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_completion_rate'] = totalCompletionRate;
    resultMap['total_orders_count'] = totalOrdersCount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStats copyWith({
    bool basicVerification,
    double buyCompletionRate,
    int buyOrdersCount,
    int cancelTimeAvg,
    bool fullVerification,
    int releaseTimeAvg,
    double sellCompletionRate,
    int sellOrdersCount,
    double totalCompletionRate,
    int totalOrdersCount,
  }) =>
      P2pAdvertiserStats(
        basicVerification: basicVerification ?? this.basicVerification,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        fullVerification: fullVerification ?? this.fullVerification,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
      );
}
