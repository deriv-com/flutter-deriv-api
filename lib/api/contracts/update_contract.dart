import 'package:flutter_deriv_api/api/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/models/update_contract_model.dart';
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

  /// Generate an instance from json
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

  /// Generate a copy of instance with given parameters
  UpdateContract copyWith({
    SpotPriceModel stopLoss,
    SpotPriceModel takeProfit,
  }) =>
      UpdateContract(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
