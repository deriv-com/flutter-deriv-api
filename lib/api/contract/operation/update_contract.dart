import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/update_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/contract_operations_exception.dart';

/// Contract update class
class UpdateContract extends UpdateContractModel {
  /// Initializes
  UpdateContract({
    SpotPriceModel stopLoss,
    SpotPriceModel takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Generate an instance from JSON
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

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// update a contract with parameters specified in [ContractUpdateRequest]
  static Future<UpdateContract> updateContract(
    ContractUpdateRequest request,
  ) async {
    final ContractUpdateResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ContractOperationException(message: response.error['message']);
    }

    return UpdateContract.fromJson(response.contractUpdate);
  }

  /// Get update history for contract as List of [HistorySpotPriceModel]
  static Future<List<HistorySpotPriceModel>> getContractUpdateHistory(
    ContractUpdateHistoryRequest request,
  ) async {
    final ContractUpdateHistoryResponse response =
        await _api.call(request: request);

    if (response.error != null) {
      throw ContractOperationException(message: response.error['message']);
    }

    return getListFromMap(
      response.contractUpdateHistory,
      itemToTypeCallback: (dynamic item) =>
          HistorySpotPriceModel.fromJson(item),
    );
  }

  /// Generate copy of instance with given parameters
  UpdateContract copyWith({
    SpotPriceModel stopLoss,
    SpotPriceModel takeProfit,
  }) =>
      UpdateContract(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
