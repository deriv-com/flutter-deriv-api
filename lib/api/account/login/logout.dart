import 'package:flutter_deriv_api/api/account/models/logout_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Logout class
class Logout extends LogoutModel {
  /// Initializes
  Logout({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from JSON
  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
        succeeded: getBool(json['logout']),
      );

  /// Generate a copy of instance with given parameters
  Logout copyWith({
    bool succeeded,
  }) =>
      Logout(
        succeeded: succeeded ?? this.succeeded,
      );
}
