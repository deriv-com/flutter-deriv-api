import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/forget_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';


/// Forget response model class
abstract class ForgetResponseModel {
  /// Initializes
  ForgetResponseModel({
    this.forget,
  });

  /// If set to `true`, stream exited and stopped. If set to `false`, stream did not exist.
  final bool? forget;
}

/// Forget response class
class ForgetResponse extends ForgetResponseModel {
  /// Initializes
  ForgetResponse({
    bool? forget,
  }) : super(
          forget: forget,
        );

  /// Creates an instance from JSON
  factory ForgetResponse.fromJson(
    dynamic forgetJson,
  ) =>
      ForgetResponse(
        forget: getBool(forgetJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['forget'] = forget;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Immediately cancels the real-time stream of messages with a specific id.
  ///
  /// For parameters information refer to [ForgetRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<ForgetResponse> forgetMethod(
    ForgetSend request,
  ) async {
    final ForgetReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ForgetException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Creates a copy of instance with given parameters
  ForgetResponse copyWith({
    bool? forget,
  }) =>
      ForgetResponse(
        forget: forget ?? this.forget,
      );
}
