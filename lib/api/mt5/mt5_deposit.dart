import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_deposit_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 deposit class
class MT5Deposit extends MT5DepositModel {
  /// Initializes
  MT5Deposit({
    bool mt5Deposit,
    int binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from response
  factory MT5Deposit.fromResponse({
    int deposit,
    int transactionId,
  }) =>
      MT5Deposit(
        mt5Deposit: getBool(deposit),
        binaryTransactionId: transactionId,
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5Deposit copyWith({
    bool mt5Deposit,
    int binaryTransactionId,
  }) =>
      MT5Deposit(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );

  /// This call allows deposit into MT5 account from binary account
  /// For parameters information refer to [Mt5DepositRequest]
  static Future<MT5Deposit> deposit(Mt5DepositRequest request) async {
    final Mt5DepositResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw MT5Exception(message: response.error['message']);
    }

    return MT5Deposit.fromResponse(
      deposit: response.mt5Deposit,
      transactionId: response.binaryTransactionId,
    );
  }
}
