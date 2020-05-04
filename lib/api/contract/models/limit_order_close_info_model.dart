import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contains information where the contract will be closed automatically
/// at the loss specified by the user.
class LimitOrderCloseInfoModel extends APIBaseModel {
  /// Initializes
  LimitOrderCloseInfoModel(
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  );

  /// Generate an instance from json
  factory LimitOrderCloseInfoModel.fromJson(Map<String, dynamic> json) =>
      LimitOrderCloseInfoModel(
        json['display_name'],
        json['order_amount'],
        getDateTime(json['order_date']),
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

  /// Generate a copy of instance with given parameters
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
