import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Local currency model class
class LocalCurrencyModel extends BaseModel {
  /// Class constructor
  LocalCurrencyModel({
    this.currencyCode,
    this.fractionalDigits,
  });

  /// Generate instance from json
  factory LocalCurrencyModel.fromJson(Map<String, dynamic> json) =>
      LocalCurrencyModel(
        currencyCode: json['key'],
        fractionalDigits: json['values']['fractional_digits'],
      );

  /// Currency code
  final String currencyCode;

  /// Number of fractional digits.
  final int fractionalDigits;

  /// Generate a copy of instance with given parameters
  LocalCurrencyModel copyWith({
    String currencyCode,
    int fractionalDigits,
  }) =>
      LocalCurrencyModel(
        currencyCode: currencyCode ?? this.currencyCode,
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
      );
}
