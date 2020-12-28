/// Login history receive model class
abstract class LoginHistoryReceiveModel {
  /// Initializes
  LoginHistoryReceiveModel({
    @required this.loginHistory,
  });

  /// Array of records of client login/logout activities
  final List<LoginHistory> loginHistory;
}

/// Login history receive class
class LoginHistoryReceive extends LoginHistoryReceiveModel {
  /// Initializes
  LoginHistoryReceive({
    @required List<LoginHistory> loginHistory,
  }) : super(
          loginHistory: loginHistory,
        );

  /// Creates an instance from JSON
  factory LoginHistoryReceive.fromJson(Map<String, dynamic> json) =>
      LoginHistoryReceive(
        loginHistory: json['login_history'] == null
            ? null
            : json['login_history']
                .map<LoginHistory>(
                    (dynamic item) => LoginHistory.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (loginHistory != null) {
      result['login_history'] =
          loginHistory.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  LoginHistoryReceive copyWith({
    List<LoginHistory> loginHistory,
  }) =>
      LoginHistoryReceive(
        loginHistory: loginHistory ?? this.loginHistory,
      );
}
/// Login history model class
abstract class LoginHistoryModel {
  /// Initializes
  LoginHistoryModel({
    @required this.action,
    @required this.environment,
    @required this.status,
    @required this.time,
  });

  /// Type of action.
  final String action;

  /// Provides details about browser, device used during login or logout
  final String environment;

  /// Status of activity: `true` - success, `false` - failure
  final bool status;

  /// Epoch time of the activity
  final int time;
}

/// Login history class
class LoginHistory extends LoginHistoryModel {
  /// Initializes
  LoginHistory({
    @required String action,
    @required String environment,
    @required bool status,
    @required int time,
  }) : super(
          action: action,
          environment: environment,
          status: status,
          time: time,
        );

  /// Creates an instance from JSON
  factory LoginHistory.fromJson(Map<String, dynamic> json) => LoginHistory(
        action: json['action'],
        environment: json['environment'],
        status: getBool(json['status']),
        time: json['time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['action'] = action;
    result['environment'] = environment;
    result['status'] = status;
    result['time'] = time;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LoginHistory copyWith({
    String action,
    String environment,
    bool status,
    int time,
  }) =>
      LoginHistory(
        action: action ?? this.action,
        environment: environment ?? this.environment,
        status: status ?? this.status,
        time: time ?? this.time,
      );
}
