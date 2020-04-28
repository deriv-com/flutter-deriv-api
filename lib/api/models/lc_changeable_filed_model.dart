import 'base_model.dart';

/// Special conditions for changing sensitive fields
class LCChangeableFiledModel extends BaseModel {
  /// Initializes
  LCChangeableFiledModel({
    this.condition,
    this.fields,
  });

  /// Creates instance from JSON
  factory LCChangeableFiledModel.fromJson(
          String action, List<dynamic> fieldsList) =>
      LCChangeableFiledModel(
        condition: action,
        fields:
            fieldsList.map<String>((dynamic item) => item.toString()).toList(),
      );

  /// condition
  final String condition;

  /// Field changes for the [condition]
  final List<String> fields;

  /// Creates a copy with given parameters
  LCChangeableFiledModel copyWith(
    String condition,
    List<String> fields,
  ) =>
      LCChangeableFiledModel(
        condition: condition ?? this.condition,
        fields: fields ?? this.fields,
      );
}
