import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Profit transaction model class
class ProfitTransactionModel extends APIBaseModel {
  /// Initializes
  ProfitTransactionModel({
    this.appId,
    this.buyPrice,
    this.contractId,
    this.longCode,
    this.payout,
    this.purchaseTime,
    this.sellPrice,
    this.sellTime,
    this.shortCode,
    this.transactionId,
  });

  /// Generate an instance from JSON
  factory ProfitTransactionModel.fromJson(Map<String, dynamic> json) =>
      ProfitTransactionModel(
        appId: json['app_id'],
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        sellPrice: json['sell_price']?.toDouble(),
        sellTime: getDateTime(json['sell_time']),
        shortCode: json['shortcode'],
        transactionId: json['transaction_id'],
      );

  /// ID of the application where this contract was purchased.
  final int appId;

  /// The buy price
  final double buyPrice;

  /// The unique contract identifier.
  final int contractId;

  /// The description of contract purchased if description is set to 1
  final String longCode;

  /// Payout price
  final double payout;

  /// Epoch purchase time of the transaction
  final DateTime purchaseTime;

  /// The price the contract sold for.
  final double sellPrice;

  /// Epoch sell time of the transaction
  final DateTime sellTime;

  /// Compact description of the contract purchased if description is set to 1
  final String shortCode;

  /// The transaction Identifier. Every contract (buy or sell) and every payment has a unique transaction identifier.
  final int transactionId;

  /// Generate a copy of instance with given parameters
  ProfitTransactionModel copyWith({
    int appId,
    double buyPrice,
    int contractId,
    String longCode,
    double payout,
    DateTime purchaseTime,
    double sellPrice,
    DateTime sellTime,
    String shortCode,
    int transactionId,
  }) =>
      ProfitTransactionModel(
        appId: appId ?? this.appId,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        sellPrice: sellPrice ?? this.sellPrice,
        sellTime: sellTime ?? this.sellTime,
        shortCode: shortCode ?? this.shortCode,
        transactionId: transactionId ?? this.transactionId,
      );
}
