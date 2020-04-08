import 'limit_order_close_info.dart';

/// Contains limit order information.
/// (Only applicable for contract with limit order).
class LimitOrder {
  /// Initializes
  LimitOrder(this.stopLoss, this.stopOut, this.takeProfit);

  /// From Json
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        json['stop_loss'] != null
            ? LimitOrderCloseInfo.fromJson(json['stop_loss'])
            : null,
        json['stop_out'] != null
            ? LimitOrderCloseInfo.fromJson(json['stop_out'])
            : null,
        json['take_profit'] != null
            ? LimitOrderCloseInfo.fromJson(json['take_profit'])
            : null,
      );

  /// Contains information where the contract will be closed automatically
  /// at the loss specified by the user.
  final LimitOrderCloseInfo stopLoss;

  /// Contains information where the contract will be closed automatically
  /// when the value of the contract is close to zero. This is set by the us.
  final LimitOrderCloseInfo stopOut;

  /// Contains information where the contract will be closed automatically
  /// at the profit specified by the user.
  final LimitOrderCloseInfo takeProfit;

  /// Clones a new instance
  LimitOrder copyWith(
    LimitOrderCloseInfo stopLoss,
    LimitOrderCloseInfo stopOut,
    LimitOrderCloseInfo takeProfit,
  ) =>
      LimitOrder(
        stopLoss ?? this.stopLoss,
        stopOut ?? this.stopOut,
        takeProfit ?? this.takeProfit,
      );
}
