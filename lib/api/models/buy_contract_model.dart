import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Buy model class
class BuyContractModel extends BaseModel {
  /// Class constructor
  BuyContractModel({
    this.balanceAfter,
    this.buyPrice,
    this.contractId,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.shortcode,
    this.startTime,
    this.transactionId,
  });

  /// Creates instance from json
  factory BuyContractModel.fromJson(Map<String, dynamic> json) =>
      BuyContractModel(
        balanceAfter: json['balance_after'],
        buyPrice: json['buy_price'],
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: json['payout'].toDouble(),
        purchaseTime: json['purchase_time'],
        shortcode: json['shortcode'],
        startTime: json['start_time'],
        transactionId: json['transaction_id'],
      );

  /// The new account balance after completion of the purchase
  final double balanceAfter;

  /// Actual effected purchase price
  final double buyPrice;

  /// Internal contract identifier
  final int contractId;

  /// The description of contract purchased
  final String longcode;

  /// Proposed payout value
  final double payout;

  /// Epoch value of the transaction purchase time
  final int purchaseTime;

  /// Compact description of the contract purchased
  final String shortcode;

  /// Epoch value showing the expected start time of the contract
  final int startTime;

  /// Internal transaction identifier
  final int transactionId;

  /// Creates copy of instance with given parameters
  BuyContractModel copyWith({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    int purchaseTime,
    String shortcode,
    int startTime,
    int transactionId,
  }) =>
      BuyContractModel(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortcode: shortcode ?? this.shortcode,
        startTime: startTime ?? this.startTime,
        transactionId: transactionId ?? this.transactionId,
      );
}
