// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_ping_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_ping_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// P2p ping response model class.
abstract class P2pPingResponseModel {
  /// Initializes P2p ping response model class .
  const P2pPingResponseModel({
    this.p2pPing,
  });

  /// Will return 'pong'
  final P2pPingEnum? p2pPing;
}

/// P2p ping response class.
class P2pPingResponse extends P2pPingResponseModel {
  /// Initializes P2p ping response class.
  const P2pPingResponse({
    P2pPingEnum? p2pPing,
  }) : super(
          p2pPing: p2pPing,
        );

  /// Creates an instance from JSON.
  factory P2pPingResponse.fromJson(
    dynamic p2pPingJson,
  ) =>
      P2pPingResponse(
        p2pPing: p2pPingJson == null ? null : p2pPingEnumMapper[p2pPingJson],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['p2p_ping'] = p2pPingEnumMapper.entries
        .firstWhere(
            (MapEntry<String, P2pPingEnum> entry) => entry.value == p2pPing)
        .key;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Requests the p2p ping request to the server.
  ///
  /// Mostly used to test the connection or to keep it alive.
  /// Throws a [APIBaseException] if API response contains an error.
  static Future<P2pPingReceive> p2pPingMethodRaw([
    P2pPingRequest? request,
  ]) async {
    final P2pPingReceive response = await _api.call(
      request: request ?? const P2pPingRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Requests the p2p ping request to the server.
  ///
  /// Mostly used to test the connection or to keep it alive.
  /// Throws a [APIBaseException] if API response contains an error.
  static Future<P2pPingResponse> p2pPingMethod([
    P2pPingRequest? request,
  ]) async {
    final P2pPingReceive response = await p2pPingMethodRaw(request);

    return P2pPingResponse.fromJson(response.p2pPing);
  }

  /// Creates a copy of instance with given parameters.
  P2pPingResponse copyWith({
    P2pPingEnum? p2pPing,
  }) =>
      P2pPingResponse(
        p2pPing: p2pPing ?? this.p2pPing,
      );
}

/// P2pPingEnum mapper.
final Map<String, P2pPingEnum> p2pPingEnumMapper = <String, P2pPingEnum>{
  "pong": P2pPingEnum.pong,
};

/// P2pPing Enum.
enum P2pPingEnum {
  /// pong.
  pong,
}
