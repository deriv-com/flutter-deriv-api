import 'package:flutter_deriv_api/api/common/models/server_time_model.dart';
import 'package:flutter_deriv_api/api/common/server_time/exceptions/server_time_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Time response class
class ServerTime extends ServerTimeModel {
  /// Initializes
  ServerTime({
    DateTime time,
  }) : super(time: time);

  /// Creates an instance from response
  factory ServerTime.fromResponse(int result) => ServerTime(
        time: getDateTime(result),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  ServerTime copyWith({
    int time,
  }) =>
      ServerTime(
        time: time ?? this.time,
      );

  /// Request back-end server epoch time.
  /// For parameters information refer to [TimeRequest].
  static Future<ServerTime> getTime(
    TimeRequest request,
  ) async {
    final TimeResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ServerTimeException(message: response.error['message']);
    }

    return ServerTime.fromResponse(response.time);
  }
}
