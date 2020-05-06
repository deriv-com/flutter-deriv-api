import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Cancel contract model class
abstract class CancelContractModel extends APIBaseModel {
  /// Initializes
  CancelContractModel({
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
