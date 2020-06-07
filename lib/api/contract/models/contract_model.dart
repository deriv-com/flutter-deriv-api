import 'contract_base_model.dart';

/// Contract class
abstract class ContractModel extends ContractBaseModel {
  /// Initializes
  ContractModel({
    this.balanceAfter,
    double buyPrice,
    int contractId,
    DateTime dateStart,
    String longCode,
    double payout,
    DateTime purchaseTime,
    String shortCode,
    int transactionId,
  }) : super(
          buyPrice: buyPrice,
          contractId: contractId,
          dateStart: dateStart,
          longCode: longCode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortCode: shortCode,
          transactionId: transactionId,
        );

  /// The new account balance after completion of the purchase
  final double balanceAfter;
}
