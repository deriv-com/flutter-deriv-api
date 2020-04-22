import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Trade event class
class TradeEventModel extends BaseModel {
  /// Class constructor
  TradeEventModel({
    this.dates,
    this.description,
  });

  /// Creates instance from json
  factory TradeEventModel.fromJson(Map<String, dynamic> json) =>
      TradeEventModel(
        dates: json['dates'],
        description: json['descrip'],
      );

  /// Dates
  String dates;

  /// Description
  String description;

  /// Creates copy of instance with given parameters
  TradeEventModel copyWith({
    String dates,
    String description,
  }) =>
      TradeEventModel(
        dates: dates ?? this.dates,
        description: description ?? this.description,
      );
}
