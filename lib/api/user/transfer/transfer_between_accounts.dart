import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/user/models/transfer_account_model.dart';
import 'package:flutter_deriv_api/api/user/models/transfer_between_accounts_model.dart';
import 'package:flutter_deriv_api/api/user/transfer/exceptions/transfer_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Transfer between accounts class
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes
  TransferBetweenAccounts({
    bool? transferBetweenAccounts,
    List<TransferAccountModel?>? accounts,
    String? clientToFullName,
    String? clientToLoginId,
    int? transactionId,
  }) : super(
          transferBetweenAccounts: transferBetweenAccounts,
          accounts: accounts,
          clientToFullName: clientToFullName,
          clientToLoginId: clientToLoginId,
          transactionId: transactionId,
        );

  /// Generates an instance from response
  factory TransferBetweenAccounts.fromResponse(
    TransferBetweenAccountsResponse response,
  ) =>
      TransferBetweenAccounts(
        transferBetweenAccounts: response.transferBetweenAccounts,
        accounts: getListFromMap(
          response.accounts,
          itemToTypeCallback: (dynamic item) =>
              TransferAccountModel.fromJson(item),
        ),
        clientToFullName: response.clientToFullName,
        clientToLoginId: response.clientToLoginid,
        transactionId: response.transactionId,
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Generates a copy of instance with given parameters
  TransferBetweenAccounts copyWith({
    bool? transferBetweenAccounts,
    List<TransferAccountModel>? accounts,
    String? clientToFullName,
    String? clientToLoginId,
    int? transactionId,
  }) =>
      TransferBetweenAccounts(
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        accounts: accounts ?? this.accounts,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginId: clientToLoginId ?? this.clientToLoginId,
        transactionId: transactionId ?? this.transactionId,
      );

  /// This call allows transfers between accounts held by a given user.
  ///
  /// Transfer funds between your fiat and crypto currency accounts (for a fee).
  /// Please note that account_from should be same as current authorized account.
  /// For parameters information refer to [TransferBetweenAccountsRequest].
  /// Throws a [TransferException] if API response contains an error
  static Future<TransferBetweenAccounts> transfer(
    TransferBetweenAccountsRequest request,
  ) async {
    final TransferBetweenAccountsResponse response =
        await _api.call<TransferBetweenAccountsResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TransferException(baseExceptionModel: baseExceptionModel),
    );

    return TransferBetweenAccounts.fromResponse(response);
  }
}
