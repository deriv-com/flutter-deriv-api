import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contract receipt class
class ContractReceiptModel extends BaseModel {
  /// Class constructor
  ContractReceiptModel({
    this.buyPrice,
    this.contractId,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.shortcode,
    this.startTime,
    this.token,
    this.transactionId,
    this.errorCode,
    this.messageToClient,
  });

  /// Creates instance from json
  factory ContractReceiptModel.fromJson(Map<String, dynamic> json) =>
      ContractReceiptModel(
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        shortcode: json['shortcode'],
        startTime: getDateTime(json['start_time']),
        token: json['token'],
        transactionId: json['transaction_id'],
        errorCode: json['code'],
        messageToClient: json['message_to_client'],
      );

  /// Actual effected purchase price
  final double buyPrice;

  /// Internal contract identifier
  final int contractId;

  /// The description of contract purchased
  final String longcode;

  /// Proposed payout value
  final double payout;

  /// Epoch value of the transaction purchase time
  final DateTime purchaseTime;

  /// Compact description of the contract purchased
  final String shortcode;

  /// Epoch value showing the expected start time of the contract
  final DateTime startTime;

  /// The token designating the account
  final String token;

  /// Internal transaction identifier
  final int transactionId;

  /// An error code
  final String errorCode;

  /// An error message localized according to the websocket
  final String messageToClient;

  /// Creates copy of instance with given parameters
  ContractReceiptModel copyWith({
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    DateTime purchaseTime,
    String shortcode,
    DateTime startTime,
    String token,
    int transactionId,
    String errorCode,
    String messageToClient,
  }) =>
      ContractReceiptModel(
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortcode: shortcode ?? this.shortcode,
        startTime: startTime ?? this.startTime,
        token: token ?? this.token,
        transactionId: transactionId ?? this.transactionId,
        errorCode: errorCode ?? this.errorCode,
        messageToClient: messageToClient ?? this.messageToClient,
      );
}
