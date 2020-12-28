/// P2p advertiser stats receive model class
abstract class P2pAdvertiserStatsReceiveModel {
  /// Initializes
  P2pAdvertiserStatsReceiveModel({
    @required this.p2pAdvertiserStats,
  });

  /// P2P advertiser statistics.
  final P2pAdvertiserStats p2pAdvertiserStats;
}

/// P2p advertiser stats receive class
class P2pAdvertiserStatsReceive extends P2pAdvertiserStatsReceiveModel {
  /// Initializes
  P2pAdvertiserStatsReceive({
    @required P2pAdvertiserStats p2pAdvertiserStats,
  }) : super(
          p2pAdvertiserStats: p2pAdvertiserStats,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStatsReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStatsReceive(
        p2pAdvertiserStats: json['p2p_advertiser_stats'] == null
            ? null
            : P2pAdvertiserStats.fromJson(json['p2p_advertiser_stats']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pAdvertiserStats != null) {
      result['p2p_advertiser_stats'] = p2pAdvertiserStats.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStatsReceive copyWith({
    P2pAdvertiserStats p2pAdvertiserStats,
  }) =>
      P2pAdvertiserStatsReceive(
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
  final double cancelTimeAvg;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// The average time taken to release funds as a seller within the requested time period, in seconds.
  final double releaseTimeAvg;

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
    double cancelTimeAvg,
    @required bool fullVerification,
    double releaseTimeAvg,
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
        cancelTimeAvg: getDouble(json['cancel_time_avg']),
        fullVerification: getBool(json['full_verification']),
        releaseTimeAvg: getDouble(json['release_time_avg']),
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        sellOrdersCount: json['sell_orders_count'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
        totalOrdersCount: json['total_orders_count'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['basic_verification'] = basicVerification;
    result['buy_completion_rate'] = buyCompletionRate;
    result['buy_orders_count'] = buyOrdersCount;
    result['cancel_time_avg'] = cancelTimeAvg;
    result['full_verification'] = fullVerification;
    result['release_time_avg'] = releaseTimeAvg;
    result['sell_completion_rate'] = sellCompletionRate;
    result['sell_orders_count'] = sellOrdersCount;
    result['total_completion_rate'] = totalCompletionRate;
    result['total_orders_count'] = totalOrdersCount;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStats copyWith({
    bool basicVerification,
    double buyCompletionRate,
    int buyOrdersCount,
    double cancelTimeAvg,
    bool fullVerification,
    double releaseTimeAvg,
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
