import 'package:flutter_deriv_api/api/models/spot_price_model.dart';

import 'base_model.dart';

/// Contains limit order information.
/// (Only applicable for contract with limit order).
class LimitOrderModel extends BaseModel {
  /// Initializes
  LimitOrderModel(this.stopLoss, this.stopOut, this.takeProfit);

  /// From Json
  factory LimitOrderModel.fromJson(Map<String, dynamic> json) =>
      LimitOrderModel(
        json['stop_loss'] == null
            ? null
            : SpotPriceModel.fromJson(json['stop_loss']),
        json['stop_out'] == null
            ? null
            : SpotPriceModel.fromJson(json['stop_out']),
        json['take_profit'] == null
            ? null
            : SpotPriceModel.fromJson(json['take_profit']),
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

  /// Clones a new instance
  LimitOrderModel copyWith(
    SpotPriceModel stopLoss,
    SpotPriceModel stopOut,
    SpotPriceModel takeProfit,
  ) =>
      LimitOrderModel(
        stopLoss ?? this.stopLoss,
        stopOut ?? this.stopOut,
        takeProfit ?? this.takeProfit,
      );
}
