import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Transaction information of the user
abstract class TransactionModel extends APIBaseModel {
  /// Initializes
  TransactionModel({
    this.action,
    this.amount,
    this.balance,
    this.barrier,
    this.contractId,
    this.currency,
    this.dateExpiry,
    this.displayName,
    this.highBarrier,
    this.id,
    this.longCode,
    this.lowBarrier,
    this.purchaseTime,
    this.stopLoss,
    this.stopOut,
    this.symbol,
    this.takeProfit,
    this.transactionId,
    this.transactionTime,
  });

  /// The transaction type.
  final TransactionActionType? action;

  /// It is the amount of transaction performed.
  final double? amount;

  /// Balance amount
  final double? balance;

  /// Barrier of the contract. Only applicable to single barrier contracts. Could be undefined if a contract does not have a barrier.
  final String? barrier;

  /// It is the contract ID.
  final String? contractId;

  /// Transaction currency
  final String? currency;

  /// Epoch value of the expiry time of the contract. Please note that in case of buy transaction this is approximate value not exact one.
  final DateTime? dateExpiry;

  /// Display name of symbol
  final String? displayName;

  /// The high barrier of a contract. Only applicable to double barrier contracts.
  final String? highBarrier;

  /// A stream ID that can be used to cancel this stream using the Forget request.
  final String? id;

  /// Description of contract purchased
  final String? longCode;

  /// The low barrier of a contract. Only applicable to double barrier contracts.
  final String? lowBarrier;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime? purchaseTime;

  /// The pip-sized target spot price where the contract will be closed automatically at the loss specified by the user.
  final String? stopLoss;

  /// The pip-sized target spot price where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final String? stopOut;

  /// Symbol code
  final String? symbol;

  /// The pip-sized target spot price where the contract will be closed automatically at the profit specified by the user.
  final String? takeProfit;

  /// It is the transaction ID. Every contract (buy or sell) or payment has a unique ID.
  final int? transactionId;

  /// Time at which transaction was performed, for buy its purchase time, for sell its sell time
  final DateTime? transactionTime;
}
