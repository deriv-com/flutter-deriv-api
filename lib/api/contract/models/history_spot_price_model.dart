import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// History spot price model
class HistorySpotPriceModel extends SpotPriceModel {
  /// Initializes
  HistorySpotPriceModel({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    this.orderType,
    String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Generates instance from JSON
  factory HistorySpotPriceModel.fromJson(Map<String, dynamic> json) =>
      HistorySpotPriceModel(
        displayName: json['display_name'],
        orderAmount: json['order_amount'] is String
            ? double.tryParse(json['order_amount'])
            : json['order_amount']?.toDouble(),
        orderDate: getDateTime(json['order_date']),
        orderType: json['order_type'],
        value: json['value'],
      );

  /// The contract parameter updated.
  final String orderType;

  /// Generate a copy of instance with given parameters with given parameters
  @override
  HistorySpotPriceModel copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String orderType,
    String value,
  }) =>
      HistorySpotPriceModel(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        orderType: orderType ?? this.orderType,
        value: value ?? this.value,
      );
}
