import 'package:flutter_deriv_api/api/common/models/server_time_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Time response class
class ServerTime extends ServerTimeModel {
  /// Initializes
  ServerTime({
    DateTime time,
  }) : super(time: time);

  /// Creates instance from json
  factory ServerTime.fromJson(Map<String, dynamic> json) => ServerTime(
        time: getDateTime(json['time']),
      );

  /// Creates copy of instance with given parameters
  ServerTime copyWith({int time}) => ServerTime(time: time ?? this.time);
}
