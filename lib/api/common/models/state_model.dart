import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// States list model class
abstract class StateModel extends APIBaseModel {
  /// Initializes
  StateModel({
    this.text,
    this.value,
  });

  /// The state name.
  final String? text;

  /// The state code.
  final String? value;
}
