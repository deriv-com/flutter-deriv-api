// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Time response model class.
abstract class TimeResponseModel extends Equatable {
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets back-end server epoch time.
  ///
  /// Throws a [ServerTimeException] if API response contains an error
  static Future<TimeResponse> fetchTime([
    TimeRequest? request,
  ]) async {
    final TimeReceive response = await _api.call(
      request: request ?? const TimeRequest(),
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
