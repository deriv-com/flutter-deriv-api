import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Stop loss model class
class SpotPriceModel extends APIBaseModel {
  /// Initializes
  SpotPriceModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Generate an instance from json
  factory SpotPriceModel.fromJson(Map<String, dynamic> json) => SpotPriceModel(
        displayName: json['display_name'],
        orderAmount: json['order_amount']?.toDouble(),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Localized display name
  final String displayName;

  /// Stop loss amount
  final double orderAmount;

  /// Stop loss order epoch
  final DateTime orderDate;

  /// Stop loss pip-sized barrier value
  final String value;

  /// Generate a copy of instance with given parameters
  SpotPriceModel copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      SpotPriceModel(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
