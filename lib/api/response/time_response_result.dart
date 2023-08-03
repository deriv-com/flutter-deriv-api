// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Time response model class.
abstract class TimeResponseModel {
  /// Initializes Time response model class .
  const TimeResponseModel({
    this.time,
  });

  /// Epoch of server time.
  final DateTime? time;
}

/// Time response class.
class TimeResponse extends TimeResponseModel {
  /// Initializes Time response class.
  const TimeResponse({
    DateTime? time,
  }) : super(
          time: time,
        );

  /// Creates an instance from JSON.
  factory TimeResponse.fromJson(
    dynamic timeJson,
  ) =>
      TimeResponse(
        time: getDateTime(timeJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['time'] = getSecondsSinceEpochDateTime(time);

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets back-end server epoch time.
  ///
  /// For parameters information refer to [TimeRequest].
  /// Throws a [ServerTimeException] if API response contains an error.
  static Future<TimeReceive> fetchTimeRaw([TimeRequest? request]) async {
    final TimeReceive response = await _api.call(
      request: request ?? const TimeRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ServerTimeException(),
    );

    return response;
  }

  /// Gets back-end server epoch time.
  ///
  /// For parameters information refer to [TimeRequest].
  /// Throws a [ServerTimeException] if API response contains an error.
  static Future<TimeResponse> fetchTime([TimeRequest? request]) async {
    final TimeReceive response = await fetchTimeRaw(request);

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
