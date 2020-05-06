import 'package:flutter_deriv_api/api/account/models/transfer_account_model.dart';
import 'package:flutter_deriv_api/api/account/models/transfer_between_accounts_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Transfer between accounts class class
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes
  TransferBetweenAccounts({
    bool transferBetweenAccounts,
    List<TransferAccountModel> accounts,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginId: clientToLoginId,
          transactionId: transactionId,
        );

  /// Generate an instance from JSON
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        transferBetweenAccounts: getBool(json['transfer_between_accounts']),
        accounts: getListFromMap(
          json['accounts'],
          itemToTypeCallback: (dynamic item) =>
              TransferAccountModel.fromJson(item),
        ),
        clientToFullName: json['client_to_full_name'],
        clientToLoginId: json['client_to_loginid'],
        transactionId: json['transaction_id'],
      );

  /// Generate a copy of instance with given parameters
  TransferBetweenAccounts copyWith({
    bool transferBetweenAccounts,
    List<TransferAccountModel> accounts,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) =>
      TransferBetweenAccounts(
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        accounts: accounts ?? this.accounts,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginId: clientToLoginId ?? this.clientToLoginId,
        transactionId: transactionId ?? this.transactionId,
      );
}
