import 'package:flutter_deriv_api/api/models/ping_model.dart';

/// Ping class
class Ping extends PingModel {
  /// Initializes
  Ping({
    String ping,
  }) : super(
          ping: ping,
        );

  /// Generate an instance from json
  factory Ping.fromJson(Map<String, dynamic> json) => Ping(
        ping: json['ping'],
      );

  /// Generate a copy of instance with given parameters
  Ping copyWith({
    String ping,
  }) =>
      Ping(
        ping: ping ?? this.ping,
      );
}
