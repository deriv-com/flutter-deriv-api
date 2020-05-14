import 'package:flutter_deriv_api/api/common/models/ping_model.dart';
import 'package:flutter_deriv_api/api/common/ping/exceptions/ping_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Ping class
class Ping extends PingModel {
  /// Initializes
  Ping({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from response
  factory Ping.fromResponse(String result) => Ping(
        succeeded: result == 'pong',
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  Ping copyWith({
    bool succeeded,
  }) =>
      Ping(
        succeeded: succeeded ?? this.succeeded,
      );

  /// To send the ping request to the server. Mostly used to test the connection or to keep it alive.
  static Future<Ping> ping(
    PingRequest request,
  ) async {
    final PingResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw PingException(message: response.error['message']);
    }

    return Ping.fromResponse(response.ping);
  }
}
