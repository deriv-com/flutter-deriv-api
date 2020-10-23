import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contains limit order information.
/// (Only applicable for contract with limit order).
@immutable
class LimitOrderModel extends APIBaseModel {
  /// Initializes
  LimitOrderModel({
    this.stopLoss,
    this.stopOut,
    this.takeProfit,
  });

  /// Generate an instance from JSON
  factory LimitOrderModel.fromJson(Map<String, dynamic> json) =>
      LimitOrderModel(
        stopLoss: getItemFromMap(
          json['stop_loss'],
          itemToTypeCallback: (dynamic item) => SpotPriceModel.fromJson(item),
        ),
        stopOut: getItemFromMap(
          json['stop_out'],
          itemToTypeCallback: (dynamic item) => SpotPriceModel.fromJson(item),
        ),
        takeProfit: getItemFromMap(
          json['take_profit'],
          itemToTypeCallback: (dynamic item) => SpotPriceModel.fromJson(item),
        ),
      );

  /// Contains information where the contract will be closed automatically
  /// at the loss specified by the user.
  final SpotPriceModel stopLoss;

  /// Contains information where the contract will be closed automatically
  /// when the value of the contract is close to zero. This is set by the us.
  final SpotPriceModel stopOut;

  /// Contains information where the contract will be closed automatically
  /// at the profit specified by the user.
  final SpotPriceModel takeProfit;

  /// Generate a copy of instance with given parameters
  LimitOrderModel copyWith(
    SpotPriceModel stopLoss,
    SpotPriceModel stopOut,
    SpotPriceModel takeProfit,
  ) =>
      LimitOrderModel(
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'stop_loss': stopLoss?.toJson(),
        'take_profit': takeProfit?.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      other is LimitOrderModel &&
      other.takeProfit == takeProfit &&
      other.stopLoss == stopLoss;

  @override
  int get hashCode => super.hashCode;
}
