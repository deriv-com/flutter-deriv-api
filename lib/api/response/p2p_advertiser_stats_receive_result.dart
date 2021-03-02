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
    @required this.totalOrdersCount,
    @required this.sellOrdersCount,
    @required this.fullVerification,
    @required this.buyOrdersCount,
    @required this.basicVerification,
    this.buyCompletionRate,
    this.cancelTimeAvg,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.totalCompletionRate,
  });

  /// The total number of orders created since advertiser registration.
  final int totalOrdersCount;

  /// The number of bselluy order orders completed within the requested time period.
  final int sellOrdersCount;

  /// Boolean value: 1 or 0, indicating whether the advertiser's address has been verified.
  final int fullVerification;

  /// The number of buy order completed within the requested time period.
  final int buyOrdersCount;

  /// Boolean value: 1 or 0, indicating whether the advertiser's identify has been verified.
  final int basicVerification;

  /// The percentage of completed orders out of total orders as a buyer within the requested time period.
  final double buyCompletionRate;

  /// The average time taken to cancel orders as a buyer within the requested time period, in seconds.
  final int cancelTimeAvg;

  /// The average time taken to release funds as a seller within the requested time period, in seconds.
  final int releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the requested time period.
  final double sellCompletionRate;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double totalCompletionRate;
}

/// P2p advertiser stats class
class P2pAdvertiserStats extends P2pAdvertiserStatsModel {
  /// Initializes
  P2pAdvertiserStats({
    @required int basicVerification,
    @required int buyOrdersCount,
    @required int fullVerification,
    @required int sellOrdersCount,
    @required int totalOrdersCount,
    double buyCompletionRate,
    int cancelTimeAvg,
    int releaseTimeAvg,
    double sellCompletionRate,
    double totalCompletionRate,
  }) : super(
          basicVerification: basicVerification,
          buyOrdersCount: buyOrdersCount,
          fullVerification: fullVerification,
          sellOrdersCount: sellOrdersCount,
          totalOrdersCount: totalOrdersCount,
          buyCompletionRate: buyCompletionRate,
          cancelTimeAvg: cancelTimeAvg,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStats.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStats(
        basicVerification: json['basic_verification'],
        buyOrdersCount: json['buy_orders_count'],
        fullVerification: json['full_verification'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        cancelTimeAvg: json['cancel_time_avg'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['full_verification'] = fullVerification;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStats copyWith({
    int basicVerification,
    int buyOrdersCount,
    int fullVerification,
    int sellOrdersCount,
    int totalOrdersCount,
    double buyCompletionRate,
    int cancelTimeAvg,
    int releaseTimeAvg,
    double sellCompletionRate,
    double totalCompletionRate,
  }) =>
      P2pAdvertiserStats(
        basicVerification: basicVerification ?? this.basicVerification,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        fullVerification: fullVerification ?? this.fullVerification,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
