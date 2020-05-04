import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Statement transaction model class
class StatementTransactionModel extends APIBaseModel {
  /// Initializes
  StatementTransactionModel({
    this.actionType,
    this.amount,
    this.appId,
    this.balanceAfter,
    this.contractId,
    this.longCode,
    this.payout,
    this.purchaseTime,
    this.referenceId,
    this.shortCode,
    this.transactionId,
    this.transactionTime,
  });

  /// Generate an instance from json
  factory StatementTransactionModel.fromJson(Map<String, dynamic> json) =>
      StatementTransactionModel(
        actionType: getEnumFromString(
          values: TransactionActionType.values,
          name: json['action_type'],
        ),
        amount: json['amount']?.toDouble(),
        appId: json['app_id'],
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        referenceId: json['reference_id'],
        shortCode: json['shortcode'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
      );

  /// It is the type of action.
  final TransactionActionType actionType;

  /// It is the amount of transaction.
  final double amount;

  /// ID of the application where this contract was purchased.
  final int appId;

  /// It is the remaining balance.
  final double balanceAfter;

  /// It is the contract ID.
  final int contractId;

  /// The description of contract purchased if description is set to `1`.
  final String longCode;

  /// Payout price
  final double payout;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime purchaseTime;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final int referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final String shortCode;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// It is the time of transaction.
  final DateTime transactionTime;

  /// Generate a copy of instance with given parameters
  StatementTransactionModel copyWith({
    TransactionActionType actionType,
    double amount,
    int appId,
    double balanceAfter,
    int contractId,
    String longCode,
    double payout,
    DateTime purchaseTime,
    int referenceId,
    String shortCode,
    int transactionId,
    DateTime transactionTime,
  }) =>
      StatementTransactionModel(
        actionType: actionType ?? this.actionType,
        amount: amount ?? this.amount,
        appId: appId ?? this.appId,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        referenceId: referenceId ?? this.referenceId,
        shortCode: shortCode ?? this.shortCode,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
      );
}
