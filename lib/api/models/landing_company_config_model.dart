import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Landing company config
class LandingCompanyConfigModel extends BaseModel {
  /// Initializes
  LandingCompanyConfigModel({this.taxDetailsRequired});

  /// Creates instance from JSON
  factory LandingCompanyConfigModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: getBool(json['tax_details_required']),
      );

  /// tax details required
  final bool taxDetailsRequired;

  /// Clones a new instance
  LandingCompanyConfigModel copyWith({
    bool taxDetailsRequired,
  }) =>
      LandingCompanyConfigModel(
        taxDetailsRequired: taxDetailsRequired ?? this.taxDetailsRequired,
      );
}
