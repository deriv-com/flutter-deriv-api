import 'base_model.dart';

/// Model class for Country with account opening
class ResidenceModel extends BaseModel {
  /// Initializes
  ResidenceModel({
    this.phoneIdd,
    this.text,
    this.value,
  });

  /// IDD code of country
  final String phoneIdd;

  /// Country full name
  final String text;

  /// 2-letter country code
  final String value;
}
