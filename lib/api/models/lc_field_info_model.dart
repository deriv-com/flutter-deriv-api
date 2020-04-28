import 'base_model.dart';

/// Landing company action with its fields
class LCFieldInfoModel extends BaseModel {
  /// Initializes
  LCFieldInfoModel({
    this.requirement,
    this.fields,
  });

  /// Creates instance from JSON
  factory LCFieldInfoModel.fromJson(String action, List<dynamic> fieldsList) =>
      LCFieldInfoModel(
        requirement: action,
        fields:
            fieldsList.map<String>((dynamic item) => item.toString()).toList(),
      );

  /// Required action
  final String requirement;

  /// Fields required for this action
  final List<String> fields;

  /// Creates a copy with given parameters
  LCFieldInfoModel copyWith(
    String requirement,
    List<String> fields,
  ) =>
      LCFieldInfoModel(
        requirement: requirement ?? this.requirement,
        fields: fields ?? this.fields,
      );
}
