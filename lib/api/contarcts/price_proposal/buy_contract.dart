import 'package:flutter_deriv_api/api/models/buy_contract_model.dart';

/// Buy class
class BuyContract extends BuyContractModel {
  /// Class constructor
  BuyContract({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    int purchaseTime,
    String shortcode,
    int startTime,
    int transactionId,
  }) : super(
    balanceAfter: balanceAfter,
    buyPrice: buyPrice,
    contractId: contractId,
    longcode: longcode,
    payout: payout,
    purchaseTime: purchaseTime,
    shortcode: shortcode,
    startTime: startTime,
    transactionId: transactionId,
  );

  /// Creates instance from json
  factory BuyContract.fromJson(Map<String, dynamic> json) =>
      BuyContract(
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

  // TODO(ramin): Will call a method to get the bought contract state

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
      BuyContract(
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