import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/transfer_account_model.dart';

/// Transfer between accounts model class
abstract class TransferBetweenAccountsModel extends BaseModel {
  /// Class constructor
  TransferBetweenAccountsModel({
    this.transferBetweenAccounts,
    this.accounts,
    this.clientToFullName,
    this.clientToLoginId,
    this.transactionId,
  });

  /// If set to `true`, transfer succeeded.
  final bool transferBetweenAccounts;

  /// The available accounts to transfer, or the accounts affected by a successful transfer.
  final List<TransferAccountModel> accounts;

  /// The account to client full name
  final String clientToFullName;

  /// The account to client login id
  final String clientToLoginId;

  /// Reference ID of transfer performed
  final int transactionId;
}
