import '../../basic_api/generated/logout_receive.dart';
import '../../basic_api/generated/logout_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Logout response model class.
abstract class LogoutResponseModel {
  /// Initializes.
  LogoutResponseModel({
    this.logout,
  });

  /// The result of logout request which is 1
  final int? logout;
}

/// Logout response class.
class LogoutResponse extends LogoutResponseModel {
  /// Initializes
  LogoutResponse({
    int? logout,
  }) : super(
          logout: logout,
        );

  /// Creates an instance from JSON
  factory LogoutResponse.fromJson(
    dynamic logoutJson,
  ) =>
      LogoutResponse(
        logout: logoutJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['logout'] = logout;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Logs out from the web-socket's session.
  ///
  /// For parameters information refer to [LogoutRequest].
  /// Throws an [AuthorizeException] if API response contains an error
  static Future<LogoutResponse> logoutMethod([
    LogoutSend? request,
  ]) async {
    final LogoutReceive response = await _api.call(
      request: request ?? const LogoutSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AuthorizeException(baseExceptionModel: baseExceptionModel),
    );

    return LogoutResponse.fromJson(response.logout);
  }

  /// Creates a copy of instance with given parameters.
  LogoutResponse copyWith({
    int? logout,
  }) =>
      LogoutResponse(
        logout: logout ?? this.logout,
      );
}
