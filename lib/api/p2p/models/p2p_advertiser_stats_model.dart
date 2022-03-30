import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// P2P advertiser stats model class
abstract class P2PAdvertiserStatsModel extends APIBaseModel {
  /// Initializes
  P2PAdvertiserStatsModel({
    this.buyOrdersCount,
    this.cancelTimeAvg,
    this.completionRate,
    this.releaseTimeAvg,
    this.sellOrdersCount,
    this.totalOrdersCount,
  });

  /// The number of buy order orders completed within the requested time period.
  final int? buyOrdersCount;

  /// The average time taken to cancel orders as a buyer within the requested time period, in seconds.
  final int? cancelTimeAvg;

  /// The percentage of completed orders out of total orders as a buyer within the requested time period.
  final double? completionRate;

  /// The average time taken to release funds as a seller within the requested time period, in seconds.
  final int? releaseTimeAvg;

  /// The number of buy sell order orders completed within the requested time period.
  final int? sellOrdersCount;

  /// The total number of orders created since advertiser registration.s
  final int? totalOrdersCount;
}
