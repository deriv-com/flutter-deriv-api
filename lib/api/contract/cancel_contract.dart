import 'package:flutter_deriv_api/api/contract/models/cancel_contract_model.dart';

/// Cancel contract class
class CancelContract extends CancelContractModel {
  /// Initializes
  CancelContract({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          contractId: contractId,
          referenceId: referenceId,
          soldFor: soldFor,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory CancelContract.fromJson(Map<String, dynamic> json) => CancelContract(
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: json['sold_for']?.toDouble(),
        transactionId: json['transaction_id'],
      );

  /// Creates a copy of instance with given parameters
  CancelContract copyWith({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) =>
      CancelContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
