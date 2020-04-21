import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/helpers.dart';

/// Contains limit order information.
/// (Only applicable for contract with limit order).
class LimitOrderModel extends BaseModel{
  /// Initializes
  LimitOrderModel(this.stopLoss, this.stopOut, this.takeProfit);

  /// From Json
  factory LimitOrderModel.fromJson(Map<String, dynamic> json) => LimitOrderModel(
        json['stop_loss'] != null
            ? LimitOrderCloseInfoModel.fromJson(json['stop_loss'])
            : null,
        json['stop_out'] != null
            ? LimitOrderCloseInfoModel.fromJson(json['stop_out'])
            : null,
        json['take_profit'] != null
            ? LimitOrderCloseInfoModel.fromJson(json['take_profit'])
            : null,
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

/// Contains information where the contract will be closed automatically
/// at the loss specified by the user.
class LimitOrderCloseInfoModel extends BaseModel{
  /// Initializes
  LimitOrderCloseInfoModel(
      this.displayName,
      this.orderAmount,
      this.orderDate,
      this.value,
      );

  /// From Json
  factory LimitOrderCloseInfoModel.fromJson(Map<String, dynamic> json) =>
      LimitOrderCloseInfoModel(
        json['display_name'],
        json['order_amount'],
        json['order_date'] != null ? getDateTime(json['order_date']) : null,
        json['value'],
      );

  /// Localized display name
  final String displayName;

  /// amount
  final double orderAmount;

  /// order epoch
  final DateTime orderDate;

  /// Pip-sized barrier value
  final String value;

  /// Clone a new instance
  LimitOrderCloseInfoModel copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      LimitOrderCloseInfoModel(
        displayName ?? this.displayName,
        orderAmount ?? this.orderAmount,
        orderDate ?? this.orderDate,
        value ?? this.value,
      );
}

