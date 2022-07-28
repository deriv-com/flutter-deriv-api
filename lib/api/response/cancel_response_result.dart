// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/cancel_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/cancel_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Cancel response model class.
abstract class CancelResponseModel {
  /// Initializes Cancel response model class .
  const CancelResponseModel({
    this.cancel,
  });

  /// Receipt for the transaction
  final Cancel? cancel;
}

/// Cancel response class.
class CancelResponse extends CancelResponseModel {
  /// Initializes Cancel response class.
  const CancelResponse({
    Cancel? cancel,
  }) : super(
          cancel: cancel,
        );

  /// Creates an instance from JSON.
  factory CancelResponse.fromJson(
    dynamic cancelJson,
  ) =>
      CancelResponse(
        cancel: cancelJson == null ? null : Cancel.fromJson(cancelJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (cancel != null) {
      resultMap['cancel'] = cancel!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Cancels a contract with parameters specified in [CancelRequest].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<CancelResponse> cancelContract(CancelRequest request) async {
    final CancelReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return CancelResponse.fromJson(response.cancel);
  }

  /// Creates a copy of instance with given parameters.
  CancelResponse copyWith({
    Cancel? cancel,
  }) =>
      CancelResponse(
        cancel: cancel ?? this.cancel,
      );
}
/// Cancel model class.
abstract class CancelModel {
  /// Initializes Cancel model class .
  const CancelModel({
    this.balanceAfter,
    this.contractId,
    this.referenceId,
    this.soldFor,
    this.transactionId,
  });

  /// New account balance after completion of the sale
  final double? balanceAfter;

  /// Internal contract identifier for the sold contract
  final int? contractId;

  /// Internal transaction identifier for the corresponding buy transaction
  final int? referenceId;

  /// Actual effected sale price
  final double? soldFor;

  /// Internal transaction identifier for the sale transaction
  final int? transactionId;
}

/// Cancel class.
class Cancel extends CancelModel {
  /// Initializes Cancel class.
  const Cancel({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          contractId: contractId,
          referenceId: referenceId,
          soldFor: soldFor,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON.
  factory Cancel.fromJson(Map<String, dynamic> json) => Cancel(
        balanceAfter: getDouble(json['balance_after']),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: getDouble(json['sold_for']),
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_after'] = balanceAfter;
    resultMap['contract_id'] = contractId;
    resultMap['reference_id'] = referenceId;
    resultMap['sold_for'] = soldFor;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Cancel copyWith({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) =>
      Cancel(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
