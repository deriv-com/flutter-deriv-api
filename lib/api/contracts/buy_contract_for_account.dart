import 'package:flutter_deriv_api/api/models/buy_contract_for_account_model.dart';
import 'package:flutter_deriv_api/api/models/contract_error_message_model.dart';
import 'package:flutter_deriv_api/api/models/contract_receipt_model.dart';

/// Buy contract for account class
class BuyContractForAccount extends BuyContractForAccountModel {
  /// Class constructor
  BuyContractForAccount({
    ContractReceiptModel contractReceipt,
    ContractErrorMessageModel contractError,
  }) : super(
          contractReceipt: contractReceipt,
          contractError: contractError,
        );

  // TODO(hamed): implement from json method
  /// Creates instance from json
  factory BuyContractForAccount.fromJson() => BuyContractForAccount();

  /// Creates copy of instance with given parameters
  BuyContractForAccount copyWith({
    ContractReceiptModel contractReceipt,
    ContractErrorMessageModel contractError,
  }) =>
      BuyContractForAccount(
        contractReceipt: contractReceipt ?? this.contractReceipt,
        contractError: contractError ?? this.contractError,
      );
}
