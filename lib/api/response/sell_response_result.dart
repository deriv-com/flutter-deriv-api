// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/sell_expired_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_expired_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_expired_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Sell response model class.
abstract class SellResponseModel {
  /// Initializes Sell response model class .
  const SellResponseModel({
    this.sell,
  });

  /// Receipt for the transaction
  final Sell? sell;
}

/// Sell response class.
class SellResponse extends SellResponseModel {
  /// Initializes Sell response class.
  const SellResponse({
    Sell? sell,
  }) : super(
          sell: sell,
        );

  /// Creates an instance from JSON.
  factory SellResponse.fromJson(
    dynamic sellJson,
  ) =>
      SellResponse(
        sell: sellJson == null ? null : Sell.fromJson(sellJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (sell != null) {
      resultMap['sell'] = sell!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Sells a contract with parameters specified in [SellRequest].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<SellResponse> sellContract(SellRequest request) async {
    final SellReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellResponse.fromJson(response.sell);
  }

  /// tries to sell any expired contracts and returns the number of sold contracts as [SellExpiredContractModel].
  ///
  /// Throws [ContractOperationException] if API response contains an error
  static Future<SellExpiredResponse> sellExpiredContracts([
    SellExpiredRequest? request,
  ]) async {
    final SellExpiredReceive response = await _api.call(
      request: request ?? const SellExpiredRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellExpiredResponse.fromJson(response.sellExpired);
  }

  /// Creates a copy of instance with given parameters.
  SellResponse copyWith({
    Sell? sell,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
      );
}

/// Sell model class.
abstract class SellModel {
  /// Initializes Sell model class .
  const SellModel({
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

/// Sell class.
class Sell extends SellModel {
  /// Initializes Sell class.
  const Sell({
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
  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
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
  Sell copyWith({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) =>
      Sell(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
