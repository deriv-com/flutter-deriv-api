// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_deposit_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_deposit_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 deposit response model class.
abstract class Mt5DepositResponseModel {
  /// Initializes Mt5 deposit response model class .
  const Mt5DepositResponseModel({
    this.mt5Deposit,
    this.binaryTransactionId,
  });

  /// 1 on success
  final int? mt5Deposit;

  /// Withdrawal reference ID of Binary account
  final int? binaryTransactionId;
}

/// Mt5 deposit response class.
class Mt5DepositResponse extends Mt5DepositResponseModel {
  /// Initializes Mt5 deposit response class.
  const Mt5DepositResponse({
    super.mt5Deposit,
    super.binaryTransactionId,
  });

  /// Creates an instance from JSON.
  factory Mt5DepositResponse.fromJson(
    dynamic mt5DepositJson,
    dynamic binaryTransactionIdJson,
  ) =>
      Mt5DepositResponse(
        mt5Deposit: mt5DepositJson,
        binaryTransactionId: binaryTransactionIdJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_deposit'] = mt5Deposit;
    resultMap['binary_transaction_id'] = binaryTransactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Allows deposit into MT5 account from binary account.
  ///
  /// For parameters information refer to [Mt5DepositRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<Mt5DepositResponse> deposit(Mt5DepositRequest request) async {
    final Mt5DepositReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return Mt5DepositResponse.fromJson(
      response.mt5Deposit,
      response.binaryTransactionId,
    );
  }

  /// Creates a copy of instance with given parameters.
  Mt5DepositResponse copyWith({
    int? mt5Deposit,
    int? binaryTransactionId,
  }) =>
      Mt5DepositResponse(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
