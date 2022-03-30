import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Trade event class
class TradeEventModel extends APIBaseModel {
  /// Initializes
  TradeEventModel({
    this.dates,
    this.description,
  });

  /// Creates an instance from JSON
  factory TradeEventModel.fromJson(Map<String, dynamic> json) =>
      TradeEventModel(
        dates: json['dates'],
        description: json['descrip'],
      );

  /// Dates
  final String? dates;

  /// Description
  final String? description;

  /// Creates a copy of instance with given parameters
  TradeEventModel copyWith({
    String? dates,
    String? description,
  }) =>
      TradeEventModel(
        dates: dates ?? this.dates,
        description: description ?? this.description,
      );
}
