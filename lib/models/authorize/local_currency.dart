import 'package:flutter_deriv_api/models/base_model.dart';

/// Local currency model class
class LocalCurrencyModel extends BaseModel {
  /// Class constructor
  LocalCurrencyModel({
    this.fractionalDigits,
  });

  /// Generate instance from json
  factory LocalCurrencyModel.fromJson(Map<String, dynamic> json) =>
      LocalCurrencyModel(
        fractionalDigits: json['fractional_digits'],
      );

  /// Number of fractional digits.
  final int fractionalDigits;
}
