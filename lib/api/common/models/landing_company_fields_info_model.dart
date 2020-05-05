import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Landing company action with its fields
class LandingCompanyFieldsInfoModel extends APIBaseModel {
  /// Initializes
  LandingCompanyFieldsInfoModel({
    this.condition,
    this.fields,
  });

  /// Generates an instance from json
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
