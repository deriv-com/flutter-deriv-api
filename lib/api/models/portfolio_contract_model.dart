import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Contract model in portfolio
class PortfolioContractModel extends BaseModel {
  /// Initializes
  PortfolioContractModel({
    this.appId,
    this.buyPrice,
    this.contractId,
    this.contractType,
    this.currency,
    this.dateStart,
    this.expiryTime,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.symbol,
    this.transactionId,
  });

  /// Instance from JSON
  factory PortfolioContractModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      PortfolioContractModel(
        appId: json['app_id'],
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        dateStart: getDateTime(json['date_start']),
        expiryTime: getDateTime(json['expiry_time']),
        longcode: json['longcode'],
        payout: json['payout'],
        purchaseTime: getDateTime(json['purchase_time']),
        symbol: json['symbol'],
        transactionId: json['transaction_id'],
      );

  /// ID of the application where this contract was purchased.
  final int appId;

  /// Buy price
  final double buyPrice;

  /// Internal contract identifier number (to be used in a 'proposal_open_contract' API call)
  final int contractId;

  /// Contract type
  final String contractType;

  /// Contract currency
  final String currency;

  /// Epoch of start date
  final DateTime dateStart;

  /// Epoch of expiry time
  final DateTime expiryTime;

  /// Contract description
  final String longcode;

  /// Payout price
  final double payout;

  /// Epoch of purchase time
  final DateTime purchaseTime;

  /// Symbol code
  final String symbol;

  /// It is the transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// ToJson
  PortfolioContractModel copyWith({
    int appId,
    double buyPrice,
    int contractId,
    String contractType,
    String currency,
    int dateStart,
    int expiryTime,
    String longcode,
    double payout,
    int purchaseTime,
    String symbol,
    int transactionId,
  }) =>
      PortfolioContractModel(
        appId: appId ?? this.appId,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateStart: dateStart ?? this.dateStart,
        expiryTime: expiryTime ?? this.expiryTime,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        symbol: symbol ?? this.symbol,
        transactionId: transactionId ?? this.transactionId,
      );
}