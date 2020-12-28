/// Ping receive model class
abstract class PingReceiveModel {
  /// Initializes
  PingReceiveModel({
    @required this.ping,
  });

  /// Will return 'pong'
  final PingEnum ping;
}

/// Ping receive class
class PingReceive extends PingReceiveModel {
  /// Initializes
  PingReceive({
    @required String ping,
  }) : super(
          ping: ping,
        );

  /// Creates an instance from JSON
  factory PingReceive.fromJson(Map<String, dynamic> json) => PingReceive(
        ping: json['ping'] == null
            ? null
            : pingEnumMapper.entries
                .firstWhere((entry) => entry.value == json['ping'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ping'] = pingEnumMapper[ping];

    return result;
  }

  /// Creates a copy of instance with given parameters
  PingReceive copyWith({
    String ping,
  }) =>
      PingReceive(
        ping: ping ?? this.ping,
      );
  // Creating Enum Mappers
  static final Map<PingEnum, String> pingEnumMapper = {
    PingEnum.pong: 'pong',
  };
}

// Creating Enums
enum PingEnum {
  pong,
}
