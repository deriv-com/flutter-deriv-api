import 'package:flutter_deriv_api/api/common/models/forget_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forget class
class Forget extends ForgetModel {
  /// Initializes
  Forget({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory Forget.fromResponse(int result) => Forget(
        succeeded: getBool(result),
      );

  /// Creates a copy of instance with given parameters
  Forget copyWith({
    bool succeeded,
  }) =>
      Forget(
        succeeded: succeeded ?? this.succeeded,
      );
}
