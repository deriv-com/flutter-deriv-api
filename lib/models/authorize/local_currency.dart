/// Local currency model class
class LocalCurrencyModel {
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
