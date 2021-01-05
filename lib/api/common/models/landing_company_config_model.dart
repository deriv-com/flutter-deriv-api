import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Landing company config
class LandingCompanyConfigModel extends APIBaseModel {
  /// Initializes
  LandingCompanyConfigModel({this.taxDetailsRequired});

  /// Creates an instance from JSON
  factory LandingCompanyConfigModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: getBool(json['tax_details_required']),
      );

  /// tax details required
  final bool taxDetailsRequired;

  /// Generate a copy of instance with given parameters
  LandingCompanyConfigModel copyWith({
    bool taxDetailsRequired,
  }) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: taxDetailsRequired ?? this.taxDetailsRequired,
      );
}
