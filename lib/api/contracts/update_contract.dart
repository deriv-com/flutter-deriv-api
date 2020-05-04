import 'package:flutter_deriv_api/api/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/models/update_contract_model.dart';

/// Contract update class
class UpdateContract extends UpdateContractModel {
  /// Class constructor
  UpdateContract({
    SpotPriceModel stopLoss,
    SpotPriceModel takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Generate instance from json
  factory UpdateContract.fromJson(Map<String, dynamic> json) => UpdateContract(
        stopLoss: json['stop_loss'] == null
            ? null
            : SpotPriceModel.fromJson(json['stop_loss']),
        takeProfit: json['take_profit'] == null
            ? null
            : SpotPriceModel.fromJson(json['take_profit']),
      );

  // TODO(ramin): update contract API call
  /// update a contract
  static Future<UpdateContract> updateContract() async => null;

  // TODO(ramin): contract update history API call
  /// Get update history for contract
  static Future<List<HistorySpotPriceModel>> getContractUpdateHistory(
          int contractId) async =>
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
