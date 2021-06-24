import 'package:flutter_deriv_api/api/contract/models/sell_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/models/sell_expired_contract_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'exceptions/contract_operations_exception.dart';

/// Selling a contract
class SellContract extends SellContractModel {
  /// Initializes
  SellContract({
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

  /// Generates an instance from JSON
  factory SellContract.fromJson(Map<String, dynamic> json) => SellContract(
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: json['sold_for']?.toDouble(),
        transactionId: json['transaction_id'],
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Sells a contract with parameters specified in [SellRequest].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<SellContract> sellContract(SellRequest request) async {
    final SellResponse response =
        await _api!.call<SellResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellContract.fromJson(response.sell!);
  }

  /// tries to sell any expired contracts and returns the number of sold contracts as [SellExpiredContractModel].
  ///
  /// Throws [ContractOperationException] if API response contains an error
  static Future<SellExpiredContractModel> sellExpiredContracts([
    SellExpiredRequest? request,
  ]) async {
    final SellExpiredResponse response = await _api!.call<SellExpiredResponse>(
      request: request ?? const SellExpiredRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellExpiredContractModel.fromJson(response.sellExpired!);
  }

  /// Generates a copy of instance with given parameters
  SellContract copyWith({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) =>
      SellContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
