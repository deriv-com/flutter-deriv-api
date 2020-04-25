import 'package:flutter_deriv_api/api/models/transaction_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Transaction of user
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    String action,
    double amount,
    double balance,
    String barrier,
    String contractId,
    String currency,
    DateTime dateExpiry,
    String displayName,
    String highBarrier,
    String id,
    String longcode,
    String lowBarrier,
    DateTime purchaseTime,
    String stopLoss,
    String stopOut,
    String symbol,
    String takeProfit,
    int transactionId,
    DateTime transactionTime,
  }) : super(
          action: action,
          amount: amount,
          balance: balance,
          barrier: barrier,
          contractId: contractId,
          currency: currency,
          dateExpiry: dateExpiry,
          displayName: displayName,
          highBarrier: highBarrier,
          id: id,
          longcode: longcode,
          lowBarrier: lowBarrier,
          purchaseTime: purchaseTime,
          stopLoss: stopLoss,
          stopOut: stopOut,
          symbol: symbol,
          takeProfit: takeProfit,
          transactionId: transactionId,
          transactionTime: transactionTime,
        );

  /// Instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        action: json['action'],
        amount: json['amount']?.toDouble(),
        balance: json['balance'],
        barrier: json['barrier'],
        contractId: json['contract_id']?.toString(),
        currency: json['currency'],
        dateExpiry: json['date_expiry'] == null
            ? null
            : getDateTime(json['date_expiry']),
        displayName: json['display_name'],
        highBarrier: json['high_barrier'],
        id: json['id'],
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        purchaseTime: json['purchase_time'] == null
            ? null
            : getDateTime(json['purchase_time']),
        stopLoss: json['stop_loss'],
        stopOut: json['stop_out'],
        symbol: json['symbol'],
        takeProfit: json['take_profit'],
        transactionId: json['transaction_id'],
        transactionTime: json['transaction_time'] == null
            ? null
            : getDateTime(json['transaction_time']),
      );

  /// Clones a new instance
  TransactionModel copyWith({
    String action,
    double amount,
    double balance,
    String barrier,
    String contractId,
    String currency,
    DateTime dateExpiry,
    String displayName,
    String highBarrier,
    String id,
    String longcode,
    String lowBarrier,
    DateTime purchaseTime,
    String stopLoss,
    String stopOut,
    String symbol,
    String takeProfit,
    int transactionId,
    DateTime transactionTime,
  }) =>
      Transaction(
          action: action ?? this.action,
          amount: amount ?? this.amount,
          balance: balance ?? this.balance,
          barrier: barrier ?? this.barrier,
          contractId: contractId ?? this.contractId,
          currency: currency ?? this.currency,
          dateExpiry: dateExpiry ?? this.dateExpiry,
          displayName: displayName ?? this.displayName,
          highBarrier: highBarrier ?? this.highBarrier,
          id: id ?? this.id,
          longcode: longcode ?? this.longcode,
          lowBarrier: lowBarrier ?? this.lowBarrier,
          purchaseTime: purchaseTime ?? this.purchaseTime,
          stopLoss: stopLoss ?? this.stopLoss,
          stopOut: stopOut ?? this.stopOut,
          symbol: symbol ?? this.symbol,
          takeProfit: takeProfit ?? this.takeProfit,
          transactionId: transactionId ?? this.transactionId,
          transactionTime: transactionTime ?? this.transactionTime);
}
