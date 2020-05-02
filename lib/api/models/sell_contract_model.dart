import 'base_model.dart';

/// Model class for selling a contract
abstract class SellContractModel extends BaseModel {
  /// Initializes
  SellContractModel({
    this.balanceAfter,
    this.contractId,
    this.referenceId,
    this.soldFor,
    this.transactionId,
  });

  /// New account balance after completion of the sale
  final double balanceAfter;

  /// Internal contract identifier for the sold contract
  final int contractId;

  /// Internal transaction identifier for the corresponding buy transaction
  final int referenceId;

  /// Actual effected sale price
  final double soldFor;

  /// Internal transaction identifier for the sale transaction
  final int transactionId;
}