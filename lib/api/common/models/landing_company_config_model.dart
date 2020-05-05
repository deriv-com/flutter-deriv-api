import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Landing company config
class LandingCompanyConfigModel extends APIBaseModel {
  /// Initializes
  LandingCompanyConfigModel({this.taxDetailsRequired});

  /// Generates an instance from json
  factory LandingCompanyConfigModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: getBool(json['tax_details_required']),
      );

  /// tax details required
  final bool taxDetailsRequired;

  /// Generates a copy of instance with given parameters
  LandingCompanyConfigModel copyWith({
    bool taxDetailsRequired,
  }) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: taxDetailsRequired ?? this.taxDetailsRequired,
      );
}
