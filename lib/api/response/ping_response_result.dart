// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/ping_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/ping_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Ping response model class.
abstract class PingResponseModel {
  /// Initializes Ping response model class .
  const PingResponseModel({
    this.ping,
  });

  /// Will return 'pong'
  final PingEnum? ping;
}

/// Ping response class.
class PingResponse extends PingResponseModel {
  /// Initializes Ping response class.
  const PingResponse({
    PingEnum? ping,
  }) : super(
          ping: ping,
        );

  /// Creates an instance from JSON.
  factory PingResponse.fromJson(
    dynamic pingJson,
  ) =>
      PingResponse(
        ping: pingJson == null ? null : pingEnumMapper[pingJson],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ping'] = pingEnumMapper.entries
        .firstWhere((MapEntry<String, PingEnum> entry) => entry.value == ping)
        .key;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Requests the ping request to the server.
  ///
  /// Mostly used to test the connection or to keep it alive.
  /// Throws a [PingException] if API response contains an error.
  static Future<PingReceive> pingMethodRaw([PingRequest? request]) async {
    final PingReceive response = await _api.call(
      request: request ?? const PingRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          PingException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Requests the ping request to the server.
  ///
  /// Mostly used to test the connection or to keep it alive.
  /// Throws a [PingException] if API response contains an error.
  static Future<PingResponse> pingMethod([PingRequest? request]) async {
    final PingReceive response = await pingMethodRaw(request);

    return PingResponse.fromJson(response.ping);
  }

  /// Creates a copy of instance with given parameters.
  PingResponse copyWith({
    PingEnum? ping,
  }) =>
      PingResponse(
        ping: ping ?? this.ping,
      );
}

/// PingEnum mapper.
final Map<String, PingEnum> pingEnumMapper = <String, PingEnum>{
  "pong": PingEnum.pong,
};

/// Ping Enum.
enum PingEnum {
  /// pong.
  pong,
}
