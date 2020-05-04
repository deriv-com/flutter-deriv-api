import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Login history model class
abstract class LoginHistoryModel extends BaseModel {
  /// Initializes
  LoginHistoryModel({
    this.action,
    this.environment,
    this.status,
    this.time,
  });

  /// Type of action.
  final LoginAction action;

  /// Provides details about browser, device used during login or logout
  final String environment;

  /// Status of activity: `true` - success, `false` - failure
  final bool status;

  /// Epoch time of the activity
  final DateTime time;
}
