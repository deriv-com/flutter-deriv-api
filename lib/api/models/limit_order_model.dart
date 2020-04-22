import 'base_model.dart';
import 'limit_order_close_info_model.dart';

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
            : LimitOrderCloseInfoModel.fromJson(json['stop_loss']),
        json['stop_out'] == null
            ? null
            : LimitOrderCloseInfoModel.fromJson(json['stop_out']),
        json['take_profit'] == null
            ? null
            : LimitOrderCloseInfoModel.fromJson(json['take_profit']),
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
