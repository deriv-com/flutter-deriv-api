import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_all_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Forget all response model class.
abstract class ForgetAllResponseModel {
  /// Initializes.
  ForgetAllResponseModel({
    this.forgetAll,
  });

  /// IDs of the cancelled streams
  final List<dynamic>? forgetAll;
}

/// Forget all response class.
class ForgetAllResponse extends ForgetAllResponseModel {
  /// Initializes
  ForgetAllResponse({
    List<dynamic>? forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from JSON
  factory ForgetAllResponse.fromJson(
    dynamic forgetAllJson,
  ) =>
      ForgetAllResponse(
        forgetAll: forgetAllJson == null
            ? null
            : List<dynamic>.from(
                forgetAllJson?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (forgetAll != null) {
      resultMap['forget_all'] = forgetAll!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Immediately cancels the real-time streams of messages of given type.
  ///
  /// For parameters information refer to [ForgetAllRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<ForgetAllResponse> forgetAllMethod(
    ForgetAllSend request,
  ) async {
    final ForgetAllReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ForgetException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  ForgetAllResponse copyWith({
    List<dynamic>? forgetAll,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
