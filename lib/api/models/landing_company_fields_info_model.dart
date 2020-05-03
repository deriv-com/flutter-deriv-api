import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Landing company action with its fields
class LandingCompanyFieldsInfoModel extends BaseModel {
  /// Initializes
  LandingCompanyFieldsInfoModel({
    this.condition,
    this.fields,
  });

  /// Creates instance from JSON
  factory LandingCompanyFieldsInfoModel.fromJson(
          String condition, List<dynamic> fieldsList) =>
      LandingCompanyFieldsInfoModel(
        condition: condition,
        fields: getListFromMap(fieldsList),
      );

  /// action
  final String condition;

  /// Fields required for this action
  final List<String> fields;

  /// Creates a copy with given parameters
  LandingCompanyFieldsInfoModel copyWith(
    String condition,
    List<String> fields,
  ) =>
      LandingCompanyFieldsInfoModel(
        condition: condition ?? this.condition,
        fields: fields ?? this.fields,
      );
}
