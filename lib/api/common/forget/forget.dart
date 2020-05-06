import 'package:flutter_deriv_api/api/common/models/forget_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forget class
class Forget extends ForgetModel {
  /// Initializes
  Forget({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from JSON
  factory Forget.fromJson(Map<String, dynamic> json) => Forget(
        succeeded: getBool(json['forget']),
      );

  /// Creates a copy of instance with given parameters
  Forget copyWith({
    bool succeeded,
  }) =>
      Forget(
        succeeded: succeeded ?? this.succeeded,
      );
}
