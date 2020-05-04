import 'package:flutter_deriv_api/api/contract/models/sell_contract_model.dart';

/// Selling a contract
class SellContract extends SellContractModel {
  /// Initializes
  SellContract({
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

  /// Instance from JSON
  factory SellContract.fromJson(Map<String, dynamic> json) => SellContract(
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: json['sold_for']?.toDouble(),
        transactionId: json['transaction_id'],
      );

  /// Clones a new instance
  SellContract copyWith({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) =>
      SellContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
