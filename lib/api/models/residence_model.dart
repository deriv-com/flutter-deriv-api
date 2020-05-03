import 'api_base_model.dart';

/// Model class for Country with account opening
class ResidenceModel extends APIBaseModel {
  /// Initializes
  ResidenceModel({
    this.phoneIdd,
    this.countryName,
    this.countryCode,
  });

  /// IDD code of country
  final String phoneIdd;

  /// Country full name
  final String countryName;

  /// 2-letter country code
  final String countryCode;
}
