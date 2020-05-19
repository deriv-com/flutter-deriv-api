import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_withdrawal_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 withdrawal class
class MT5Withdrawal extends MT5WithdrawalModel {
  /// Initializes
  MT5Withdrawal({
    bool mt5Withdrawal,
    int binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from response
  factory MT5Withdrawal.fromResponse({
    int mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      MT5Withdrawal(
        mt5Withdrawal: getBool(mt5Withdrawal),
        binaryTransactionId: binaryTransactionId,
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5Withdrawal copyWith({
    bool mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      MT5Withdrawal(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );

  /// This call allows withdrawal from MT5 account to Binary account.
  /// For parameters information refer to [Mt5WithdrawalRequest].
  static Future<MT5Withdrawal> withdraw(
    Mt5WithdrawalRequest request,
  ) async {
    final Mt5WithdrawalResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => MT5Exception(
        message: message,
      ),
    );

    return MT5Withdrawal.fromResponse(
      mt5Withdrawal: response.mt5Withdrawal,
      binaryTransactionId: response.binaryTransactionId,
    );
  }
}
