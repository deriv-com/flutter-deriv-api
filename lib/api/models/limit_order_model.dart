import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';
import 'limit_order_close_info_model.dart';

/// Contains limit order information.
/// (Only applicable for contract with limit order).
class LimitOrderModel extends APIBaseModel {
  /// Initializes
  LimitOrderModel(this.stopLoss, this.stopOut, this.takeProfit);

  /// From Json
  factory LimitOrderModel.fromJson(Map<String, dynamic> json) =>
      LimitOrderModel(
        getItemFromMap(
          json['stop_loss'],
          itemToTypeCallback: (dynamic item) =>
              LimitOrderCloseInfoModel.fromJson(item),
        ),
        getItemFromMap(
          json['stop_out'],
          itemToTypeCallback: (dynamic item) =>
              LimitOrderCloseInfoModel.fromJson(item),
        ),
        getItemFromMap(
          json['take_profit'],
          itemToTypeCallback: (dynamic item) =>
              LimitOrderCloseInfoModel.fromJson(item),
        ),
      );

  /// Contains information where the contract will be closed automatically
  /// at the loss specified by the user.
  final LimitOrderCloseInfoModel stopLoss;

  /// Contains information where the contract will be closed automatically
  /// when the value of the contract is close to zero. This is set by the us.
  final LimitOrderCloseInfoModel stopOut;

  /// Contains information where the contract will be closed automatically
  /// at the profit specified by the user.
  final LimitOrderCloseInfoModel takeProfit;

  /// Clones a new instance
  LimitOrderModel copyWith(
    LimitOrderCloseInfoModel stopLoss,
    LimitOrderCloseInfoModel stopOut,
    LimitOrderCloseInfoModel takeProfit,
  ) =>
      LimitOrderModel(
        stopLoss ?? this.stopLoss,
        stopOut ?? this.stopOut,
        takeProfit ?? this.takeProfit,
      );
}
