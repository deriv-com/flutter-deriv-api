import 'api_base_model.dart';

/// Buy model class
abstract class BuyContractModel extends APIBaseModel {
  /// Initializes
  BuyContractModel({
    this.balanceAfter,
    this.buyPrice,
    this.contractId,
    this.longCode,
    this.payout,
    this.purchaseTime,
    this.shortCode,
    this.startTime,
    this.transactionId,
  });

  /// The new account balance after completion of the purchase
  final double balanceAfter;

  /// Actual effected purchase price
  final double buyPrice;

  /// Internal contract identifier
  final int contractId;

  /// The description of contract purchased
  final String longCode;

  /// Proposed payout value
  final double payout;

  /// Epoch value of the transaction purchase time
  final DateTime purchaseTime;

  /// Compact description of the contract purchased
  final String shortCode;

  /// Epoch value showing the expected start time of the contract
  final DateTime startTime;

  /// Internal transaction identifier
  final int transactionId;
}
