import 'base_model.dart';

/// Landing company action with its fields
class LCFieldInfoModel extends BaseModel {
  /// Initializes
  LCFieldInfoModel({
    this.condition,
    this.fields,
  });

  /// Creates instance from JSON
  factory LCFieldInfoModel.fromJson(
          String condition, List<dynamic> fieldsList) =>
      LCFieldInfoModel(
        condition: condition,
        fields:
            fieldsList.map<String>((dynamic item) => item.toString()).toList(),
      );

  /// action
  final String condition;

  /// Fields required for this action
  final List<String> fields;

  /// Creates a copy with given parameters
  LCFieldInfoModel copyWith(
    String condition,
    List<String> fields,
  ) =>
      LCFieldInfoModel(
        condition: condition ?? this.condition,
        fields: fields ?? this.fields,
      );
}
