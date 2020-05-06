import 'package:flutter_deriv_api/api/common/models/ping_model.dart';

/// Ping class
class Ping extends PingModel {
  /// Initializes
  Ping({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from JSON
  factory Ping.fromJson(Map<String, dynamic> json) => Ping(
        succeeded: json['ping'] == 'pong',
      );

  /// Generate a copy of instance with given parameters
  Ping copyWith({
    bool succeeded,
  }) =>
      Ping(
        succeeded: succeeded ?? this.succeeded,
      );
}
