/// Time send model class
abstract class TimeSendModel {
  /// Initializes
  TimeSendModel({
    @required this.time,
  });

  /// Must be `1`
  final int time;
}

/// Time send class
class TimeSend extends TimeSendModel {
  /// Initializes
  TimeSend({
    @required int time,
  }) : super(
          time: time,
        );

  /// Creates an instance from JSON
  factory TimeSend.fromJson(Map<String, dynamic> json) => TimeSend(
        time: json['time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['time'] = time;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TimeSend copyWith({
    int time,
  }) =>
      TimeSend(
        time: time ?? this.time,
      );
}
