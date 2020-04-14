import 'package:flutter_deriv_api/helpers.dart';

/// Contains information where the contract will be closed automatically
/// at the loss specified by the user.
class LimitOrderCloseInfo {
  /// Initializes
  LimitOrderCloseInfo(
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  );

  /// From Json
  factory LimitOrderCloseInfo.fromJson(Map<String, dynamic> json) =>
      LimitOrderCloseInfo(
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
  LimitOrderCloseInfo copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      LimitOrderCloseInfo(
        displayName ?? this.displayName,
        orderAmount ?? this.orderAmount,
        orderDate ?? this.orderDate,
        value ?? this.value,
      );
}
