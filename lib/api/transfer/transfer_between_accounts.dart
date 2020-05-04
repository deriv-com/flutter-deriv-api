import 'package:flutter_deriv_api/api/models/transfer_account_model.dart';
import 'package:flutter_deriv_api/api/models/transfer_between_accounts_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Transfer between accounts class class
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes
  TransferBetweenAccounts({
    bool transferBetweenAccounts,
    List<TransferAccountModel> accounts,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginId: clientToLoginid,
          transactionId: transactionId,
        );

  /// Generate an instance from json
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        transferBetweenAccounts: getBool(json['transfer_between_accounts']),
        accounts: json['accounts'] == null
            ? null
            : json['accounts']
                .map<TransferAccountModel>(
                    (dynamic item) => TransferAccountModel.fromJson(item))
                .toList(),
        clientToFullName: json['client_to_full_name'],
        clientToLoginid: json['client_to_loginid'],
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
        clientToLoginid: clientToLoginId ?? this.clientToLoginId,
        transactionId: transactionId ?? this.transactionId,
      );
}
