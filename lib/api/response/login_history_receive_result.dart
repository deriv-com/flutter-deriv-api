import '../../basic_api/generated/login_history_receive.dart';
import '../../basic_api/generated/login_history_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Login history response model class.
abstract class LoginHistoryResponseModel {
  /// Initializes Login history response model class .
  LoginHistoryResponseModel({
    this.loginHistory,
  });

  /// Array of records of client login/logout activities
  final List<LoginHistoryItem>? loginHistory;
}

/// Login history response class.
class LoginHistoryResponse extends LoginHistoryResponseModel {
  /// Initializes Login history response class.
  LoginHistoryResponse({
    List<LoginHistoryItem>? loginHistory,
  }) : super(
          loginHistory: loginHistory,
        );

  /// Creates an instance from JSON.
  factory LoginHistoryResponse.fromJson(
    dynamic loginHistoryJson,
  ) =>
      LoginHistoryResponse(
        loginHistory: loginHistoryJson == null
            ? null
            : List<LoginHistoryItem>.from(
                loginHistoryJson?.map(
                  (dynamic item) => LoginHistoryItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (loginHistory != null) {
      resultMap['login_history'] = loginHistory!
          .map<dynamic>(
            (LoginHistoryItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves a summary of login history for user.
  ///
  /// For parameters information refer to [LoginHistory].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<LoginHistoryResponse> fetchHistory([
    LoginHistoryRequest? request,
  ]) async {
    final LoginHistoryReceive response = await _api.call(
      request: request ?? const LoginHistoryRequest(limit: 10),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AuthorizeException(baseExceptionModel: baseExceptionModel),
    );

    return LoginHistoryResponse.fromJson(response.loginHistory);
  }

  /// Creates a copy of instance with given parameters.
  LoginHistoryResponse copyWith({
    List<LoginHistoryItem>? loginHistory,
  }) =>
      LoginHistoryResponse(
        loginHistory: loginHistory ?? this.loginHistory,
      );
}
/// Login history item model class.
abstract class LoginHistoryItemModel {
  /// Initializes Login history item model class .
  LoginHistoryItemModel({
    required this.time,
    required this.status,
    required this.environment,
    required this.action,
  });

  /// Epoch time of the activity
  final DateTime time;

  /// Status of activity: `true` - success, `false` - failure
  final bool status;

  /// Provides details about browser, device used during login or logout
  final String environment;

  /// Type of action.
  final String action;
}

/// Login history item class.
class LoginHistoryItem extends LoginHistoryItemModel {
  /// Initializes Login history item class.
  LoginHistoryItem({
    required String action,
    required String environment,
    required bool status,
    required DateTime time,
  }) : super(
          action: action,
          environment: environment,
          status: status,
          time: time,
        );

  /// Creates an instance from JSON.
  factory LoginHistoryItem.fromJson(Map<String, dynamic> json) =>
      LoginHistoryItem(
        action: json['action'],
        environment: json['environment'],
        status: getBool(json['status'])!,
        time: getDateTime(json['time'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action'] = action;
    resultMap['environment'] = environment;
    resultMap['status'] = status;
    resultMap['time'] = getSecondsSinceEpochDateTime(time);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LoginHistoryItem copyWith({
    required String action,
    required String environment,
    required bool status,
    required DateTime time,
  }) =>
      LoginHistoryItem(
        action: action,
        environment: environment,
        status: status,
        time: time,
      );
}
