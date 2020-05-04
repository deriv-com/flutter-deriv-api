import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Statement transaction model class
class StatementTransactionModel extends BaseModel {
  /// Initializes
  StatementTransactionModel({
    this.actionType,
    this.amount,
    this.appId,
    this.balanceAfter,
    this.contractId,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.referenceId,
    this.shortcode,
    this.transactionId,
    this.transactionTime,
  });

  /// Generate an instance from json
  factory StatementTransactionModel.fromJson(Map<String, dynamic> json) =>
      StatementTransactionModel(
        actionType: EnumHelper.getEnum(
          values: StatementTransactionActionType.values,
          name: json['action_type'],
        ),
        amount: json['amount']?.toDouble(),
        appId: json['app_id'],
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        referenceId: json['reference_id'],
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
      );

  /// It is the type of action.
  final StatementTransactionActionType actionType;

  /// It is the amount of transaction.
  final double amount;

  /// ID of the application where this contract was purchased.
  final int appId;

  /// It is the remaining balance.
  final double balanceAfter;

  /// It is the contract ID.
  final int contractId;

  /// The description of contract purchased if description is set to `1`.
  final String longcode;

  /// Payout price
  final double payout;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime purchaseTime;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final int referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final String shortcode;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// It is the time of transaction.
  final DateTime transactionTime;

  /// Generate a copy of instance with given parameters
  StatementTransactionModel copyWith({
    StatementTransactionActionType actionType,
    double amount,
    int appId,
    double balanceAfter,
    int contractId,
    String longcode,
    double payout,
    DateTime purchaseTime,
    int referenceId,
    String shortcode,
    int transactionId,
    DateTime transactionTime,
  }) =>
      StatementTransactionModel(
        actionType: actionType ?? this.actionType,
        amount: amount ?? this.amount,
        appId: appId ?? this.appId,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        referenceId: referenceId ?? this.referenceId,
        shortcode: shortcode ?? this.shortcode,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
      );
}
