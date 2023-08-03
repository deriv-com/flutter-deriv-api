// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_withdrawal_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_withdrawal_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 withdrawal response model class.
abstract class Mt5WithdrawalResponseModel {
  /// Initializes Mt5 withdrawal response model class .
  const Mt5WithdrawalResponseModel({
    this.mt5Withdrawal,
    this.binaryTransactionId,
  });

  /// `1` on success
  final int? mt5Withdrawal;

  /// Deposit reference ID of Binary account.
  final int? binaryTransactionId;
}

/// Mt5 withdrawal response class.
class Mt5WithdrawalResponse extends Mt5WithdrawalResponseModel {
  /// Initializes Mt5 withdrawal response class.
  const Mt5WithdrawalResponse({
    int? mt5Withdrawal,
    int? binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON.
  factory Mt5WithdrawalResponse.fromJson(
    dynamic mt5WithdrawalJson,
    dynamic binaryTransactionIdJson,
  ) =>
      Mt5WithdrawalResponse(
        mt5Withdrawal: mt5WithdrawalJson,
        binaryTransactionId: binaryTransactionIdJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_withdrawal'] = mt5Withdrawal;
    resultMap['binary_transaction_id'] = binaryTransactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Allows withdrawal from MT5 account to Binary account.
  ///
  /// For parameters information refer to [Mt5WithdrawalRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5WithdrawalResponse> withdraw(
    Mt5WithdrawalRequest request,
  ) async {
    final Mt5WithdrawalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5WithdrawalResponse.fromJson(
      response.mt5Withdrawal,
      response.binaryTransactionId,
    );
  }

  /// Creates a copy of instance with given parameters.
  Mt5WithdrawalResponse copyWith({
    int? mt5Withdrawal,
    int? binaryTransactionId,
  }) =>
      Mt5WithdrawalResponse(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
