import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/update_contract_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'exceptions/contract_operations_exception.dart';

/// Contract update class
class UpdateContract extends UpdateContractModel {
  /// Initializes
  UpdateContract({
    SpotPriceModel? stopLoss,
    SpotPriceModel? takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Generates an instance from JSON
  factory UpdateContract.fromJson(Map<String, dynamic> json) => UpdateContract(
        stopLoss: getItemFromMap(
          json['stop_loss'],
          itemToTypeCallback: (dynamic item) => SpotPriceModel.fromJson(item),
        ),
        takeProfit: getItemFromMap(
          json['take_profit'],
          itemToTypeCallback: (dynamic item) => SpotPriceModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// updates a contract with parameters specified in [ContractUpdateRequest].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<UpdateContract> updateContract(
    ContractUpdateRequest request,
  ) async {
    final ContractUpdateResponse response =
        await _api.call<ContractUpdateResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return UpdateContract.fromJson(response.contractUpdate!);
  }

  /// Gets update history for contract as List of [HistorySpotPriceModel]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<List<HistorySpotPriceModel?>?> fetchContractUpdateHistory(
    ContractUpdateHistoryRequest request,
  ) async {
    final ContractUpdateHistoryResponse response =
        await _api.call<ContractUpdateHistoryResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.contractUpdateHistory,
      itemToTypeCallback: (dynamic item) =>
          HistorySpotPriceModel.fromJson(item),
    );
  }

  /// Generates a copy of instance with given parameters
  UpdateContract copyWith({
    SpotPriceModel? stopLoss,
    SpotPriceModel? takeProfit,
  }) =>
      UpdateContract(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
