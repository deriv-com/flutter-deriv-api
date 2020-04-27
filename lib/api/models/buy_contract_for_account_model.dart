import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/contract_receipt_model.dart';

/// Buy contract for accounts model
abstract class BuyContractForAccountModel extends BaseModel {
  /// Class constructor
  BuyContractForAccountModel({
    this.contractReceipt,
  });

  /// Receipt for one contract
  final ContractReceiptModel contractReceipt;
}
