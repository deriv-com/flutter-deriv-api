import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Landing company config
class LCConfig extends BaseModel {
  /// Initializes
  LCConfig({this.taxDetailsRequired});

  /// Creates instance from JSON
  factory LCConfig.fromJson(
    Map<String, dynamic> json,
  ) =>
      LCConfig(
        taxDetailsRequired: getBool(json['tax_details_required']),
      );

  /// tax details required
  final bool taxDetailsRequired;

  /// Clones a new instance
  LCConfig copyWith({
    bool taxDetailsRequired,
  }) =>
      LCConfig(
        taxDetailsRequired: taxDetailsRequired ?? this.taxDetailsRequired,
      );
}
