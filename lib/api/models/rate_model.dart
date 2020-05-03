import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// rate model class
class RateModel extends APIBaseModel {
  /// Initializes
  RateModel({
    this.code,
    this.rate,
  });

  /// Generate an instance from json
  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        code: json['key'],
        rate: json['values']?.toDouble(),
      );

  /// Currency code
  final String code;

  /// Currency rate
  final double rate;

  /// Generate a copy of instance with given parameters
  RateModel copyWith({
    String code,
    double rate,
  }) =>
      RateModel(
        code: code ?? this.code,
        rate: rate ?? this.rate,
      );
}
