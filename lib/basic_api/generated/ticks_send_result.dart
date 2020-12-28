/// Ticks send model class
abstract class TicksSendModel {
  /// Initializes
  TicksSendModel({
    @required this.ticks,
    this.subscribe,
  });

  /// The short symbol name or array of symbols (obtained from `active_symbols` call).
  final UNKNOWN_TYPE ticks;

  /// [Optional] If set to 1, will send updates whenever a new tick is received.
  final int subscribe;
}

/// Ticks send class
class TicksSend extends TicksSendModel {
  /// Initializes
  TicksSend({
    @required UNKNOWN_TYPE ticks,
    int subscribe,
  }) : super(
          ticks: ticks,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory TicksSend.fromJson(Map<String, dynamic> json) => TicksSend(
        ticks: json['ticks'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ticks'] = ticks;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TicksSend copyWith({
    UNKNOWN_TYPE ticks,
    int subscribe,
  }) =>
      TicksSend(
        ticks: ticks ?? this.ticks,
        subscribe: subscribe ?? this.subscribe,
      );
}
