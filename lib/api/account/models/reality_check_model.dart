import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Reality check model class
abstract class RealityCheckModel extends APIBaseModel {
  /// Initializes
  RealityCheckModel({
    this.buyAmount,
    this.buyCount,
    this.currency,
    this.loginId,
    this.openContractCount,
    this.potentialProfit,
    this.sellAmount,
    this.sellCount,
    this.startTime,
  });

  /// Total amount of contract purchased.
  final double? buyAmount;

  /// Total count of contract purchased.
  final int? buyCount;

  /// Currency of client account i.e currency for trading
  final String? currency;

  /// Client loginid.
  final String? loginId;

  /// Total count of contracts that are not yet expired.
  final int? openContractCount;

  /// Indicative profit of contract as per current market price.
  final double? potentialProfit;

  /// Total amount of contracts sold.
  final double? sellAmount;

  /// Total count of contract sold.
  final int? sellCount;

  /// Reality check summary start time epoch
  final DateTime? startTime;
}
