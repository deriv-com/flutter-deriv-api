import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Model class for contract
abstract class ContractModel extends APIBaseModel {
  /// Initializes
  ContractModel({
    this.balanceAfter,
    this.buyPrice,
    this.contractId,
    this.dateStart,
    this.longCode,
    this.payout,
    this.purchaseTime,
    this.shortCode,
    this.transactionId,
  });

  /// The new account balance after completion of the purchase
  final double? balanceAfter;

  /// Price at which contract was purchased
  final double? buyPrice;

  /// The internal contract identifier
  final int? contractId;

  /// Epoch of purchase time, will be same as `date_start` for all contracts except forward starting contracts.
  final DateTime? dateStart;

  /// Text description of the contract purchased, Example: Win payout if Volatility 100 Index is strictly higher than entry spot at 10 minutes after contract start time.
  final String? longCode;

  /// Payout value of the contract.
  final double? payout;

  /// Epoch of purchase time, will be same as `date_start` for all contracts except forward starting contracts.
  final DateTime? purchaseTime;

  /// Coded description of the contract purchased.
  final String? shortCode;

  /// Internal transaction identifier
  final int? transactionId;
}
