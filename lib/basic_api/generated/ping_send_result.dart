/// Ping send model class
abstract class PingSendModel {
  /// Initializes
  PingSendModel({
    @required this.ping,
  });

  /// Must be `1`
  final int ping;
}

/// Ping send class
class PingSend extends PingSendModel {
  /// Initializes
  PingSend({
    @required int ping,
  }) : super(
          ping: ping,
        );

  /// Creates an instance from JSON
  factory PingSend.fromJson(Map<String, dynamic> json) => PingSend(
        ping: json['ping'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ping'] = ping;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PingSend copyWith({
    int ping,
  }) =>
      PingSend(
        ping: ping ?? this.ping,
      );
}
