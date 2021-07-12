import '../../basic_api/generated/time_receive.dart';
import '../../basic_api/generated/time_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Time response model class.
abstract class TimeResponseModel {
  /// Initializes.
  TimeResponseModel({
    this.time,
  });

  /// Epoch of server time.
  final DateTime? time;
}

/// Time response class.
class TimeResponse extends TimeResponseModel {
  /// Initializes
  TimeResponse({
    DateTime? time,
  }) : super(
          time: time,
        );

  /// Creates an instance from JSON
  factory TimeResponse.fromJson(
    dynamic timeJson,
  ) =>
      TimeResponse(
        time: getDateTime(timeJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['time'] = getSecondsSinceEpochDateTime(time);

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets back-end server epoch time.
  ///
  /// Throws a [ServerTimeException] if API response contains an error
  static Future<TimeResponse> fetchTime([
    TimeSend? request,
  ]) async {
    final TimeReceive response = await _api.call(
      request: request ?? const TimeSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ServerTimeException(),
    );

    return TimeResponse.fromJson(response.time);
  }

  /// Creates a copy of instance with given parameters.
  TimeResponse copyWith({
    DateTime? time,
  }) =>
      TimeResponse(
        time: time ?? this.time,
      );
}
