import 'base_model.dart';

/// Legal requirement for Landing Company.
class LCRequirementModel extends BaseModel {
  /// Initializes
  LCRequirementModel({
    this.requirement,
    this.fields,
  });

  /// Creates instance from JSON
  factory LCRequirementModel.fromJson(
          String action, List<dynamic> fieldsList) =>
      LCRequirementModel(
        requirement: action,
        fields:
            fieldsList.map<String>((dynamic item) => item.toString()).toList(),
      );

  /// Required action
  final String requirement;

  /// Fields required for this action
  final List<String> fields;

  /// Creates a copy with given parameters
  LCRequirementModel copyWith(
    String requirement,
    List<String> fields,
  ) =>
      LCRequirementModel(
        requirement: requirement ?? this.requirement,
        fields: fields ?? this.fields,
      );
}
