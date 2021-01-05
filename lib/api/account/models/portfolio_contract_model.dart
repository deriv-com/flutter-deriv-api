import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Contract model in portfolio
class PortfolioContractModel extends APIBaseModel {
  /// Initializes
  PortfolioContractModel({
    this.appId,
    this.buyPrice,
    this.contractId,
    this.contractType,
    this.currency,
    this.dateStart,
    this.expiryTime,
    this.longCode,
    this.payout,
    this.purchaseTime,
    this.symbol,
    this.transactionId,
  });

  /// Generate an instance from JSON
  factory PortfolioContractModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      PortfolioContractModel(
        appId: json['app_id'],
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        contractType: getEnumFromString(
          values: ContractType.values,
          name: json['contract_type'],
          enumCase: EnumCase.upperCase,
        ),
        currency: json['currency'],
        dateStart: getDateTime(json['date_start']),
        expiryTime: getDateTime(json['expiry_time']),
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
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
  final ContractType contractType;

  /// Contract currency
  final String currency;

  /// Epoch of start date
  final DateTime dateStart;

  /// Epoch of expiry time
  final DateTime expiryTime;

  /// Contract description
  final String longCode;

  /// Payout price
  final double payout;

  /// Epoch of purchase time
  final DateTime purchaseTime;

  /// Symbol code
  final String symbol;

  /// It is the transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// Generate a copy of instance with given parameters
  PortfolioContractModel copyWith({
    int appId,
    double buyPrice,
    int contractId,
    ContractType contractType,
    String currency,
    DateTime dateStart,
    DateTime expiryTime,
    String longCode,
    double payout,
    DateTime purchaseTime,
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
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        symbol: symbol ?? this.symbol,
        transactionId: transactionId ?? this.transactionId,
      );
}
