import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/login_history_model.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Login history class
class LoginHistory extends LoginHistoryModel {
  /// Initializes
  LoginHistory({
    LoginAction action,
    String environment,
    bool status,
    DateTime time,
  }) : super(
          action: action,
          environment: environment,
          status: status,
          time: time,
        );

  /// Generate an instance from json
  factory LoginHistory.fromJson(Map<String, dynamic> json) => LoginHistory(
        action: EnumHelper.getEnum(
          values: LoginAction.values,
          name: json['action'],
        ),
        environment: json['environment'],
        status: getBool(json['status']),
        time: getDateTime(json['time']),
      );

  /// Generate a copy of instance with given parameters
  LoginHistory copyWith({
    LoginAction action,
    String environment,
    bool status,
    DateTime time,
  }) =>
      LoginHistory(
        action: action ?? this.action,
        environment: environment ?? this.environment,
        status: status ?? this.status,
        time: time ?? this.time,
      );
}
