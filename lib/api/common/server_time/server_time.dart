import 'package:flutter_deriv_api/api/common/models/server_time_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Time response class
class ServerTime extends ServerTimeModel {
  /// Initializes
  ServerTime({
    DateTime time,
  }) : super(time: time);

  /// Creates an instance from JSON
  factory ServerTime.fromJson(Map<String, dynamic> json) => ServerTime(
        time: getDateTime(json['time']),
      );

  /// Creates a copy of instance with given parameters
  ServerTime copyWith({int time}) => ServerTime(time: time ?? this.time);
}
