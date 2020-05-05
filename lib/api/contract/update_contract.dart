import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/models/update_contract_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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

  /// Generates an instance from json
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

  // TODO(ramin): update contract API call
  /// update a contract
  static Future<UpdateContract> updateContract(
    int contractId, {
    double stopLoss,
    double takeProfit,
  }) async =>
      null;

  // TODO(ramin): contract update history API call
  /// Get update history for contract
  static Future<List<HistorySpotPriceModel>> getContractUpdateHistory(
    int contractId,
  ) async =>
      null;

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
