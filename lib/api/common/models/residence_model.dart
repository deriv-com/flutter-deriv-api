import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Model class for Country with account opening
class ResidenceModel extends APIBaseModel {
  /// Initializes
  ResidenceModel({
    this.phoneIdd,
    this.countryName,
    this.countryCode,
    this.tinFormat,
    this.disabled,
    this.selected,
  });

  /// IDD code of country
  final String phoneIdd;

  /// Country full name
  final String countryName;

  /// 2-letter country code
  final String countryCode;

  /// Country tax identifier format
  final List<String> tinFormat;

  /// Is disabled
  final String disabled;

  /// Is selected
  final String selected;
}
