/// Time receive model class
abstract class TimeReceiveModel {
  /// Initializes
  TimeReceiveModel({
    @required this.time,
  });

  /// Epoch of server time.
  final int time;
}

/// Time receive class
class TimeReceive extends TimeReceiveModel {
  /// Initializes
  TimeReceive({
    @required int time,
  }) : super(
          time: time,
        );

  /// Creates an instance from JSON
  factory TimeReceive.fromJson(Map<String, dynamic> json) => TimeReceive(
        time: json['time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['time'] = time;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TimeReceive copyWith({
    int time,
  }) =>
      TimeReceive(
        time: time ?? this.time,
      );
}
