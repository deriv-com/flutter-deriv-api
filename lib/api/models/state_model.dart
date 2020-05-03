import 'base_model.dart';

/// States list model class
abstract class StateModel extends BaseModel {
  /// Initializes
  StateModel({
    this.text,
    this.value,
  });

  /// The state name.
  final String text;

  /// The state code.
  final String value;
}
