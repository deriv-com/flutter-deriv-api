import 'package:flutter_deriv_api/api/models/buy_contract_for_account_model.dart';
import 'package:flutter_deriv_api/api/models/contract_receipt_model.dart';

/// Buy contract for account class
class BuyContractForAccount extends BuyContractForAccountModel {
  /// Class constructor
  BuyContractForAccount({
    ContractReceiptModel contractReceipt,
  }) : super(
          contractReceipt: contractReceipt,
        );

  /// Creates instance from json
  factory BuyContractForAccount.fromJson(Map<String, dynamic> json) =>
      BuyContractForAccount(
        contractReceipt:
            json == null ? null : ContractReceiptModel.fromJson(json),
      );

  /// Creates copy of instance with given parameters
  BuyContractForAccount copyWith({
    ContractReceiptModel contractReceipt,
  }) =>
      BuyContractForAccount(
        contractReceipt: contractReceipt ?? this.contractReceipt,
      );
}
