/// Mt5 get settings send model class
abstract class Mt5GetSettingsSendModel {
  /// Initializes
  Mt5GetSettingsSendModel({
    @required this.mt5GetSettings,
    @required this.login,
  });

  /// Must be `1`
  final int mt5GetSettings;

  /// MT5 user login
  final String login;
}

/// Mt5 get settings send class
class Mt5GetSettingsSend extends Mt5GetSettingsSendModel {
  /// Initializes
  Mt5GetSettingsSend({
    @required int mt5GetSettings,
    @required String login,
  }) : super(
          mt5GetSettings: mt5GetSettings,
          login: login,
        );

  /// Creates an instance from JSON
  factory Mt5GetSettingsSend.fromJson(Map<String, dynamic> json) =>
      Mt5GetSettingsSend(
        mt5GetSettings: json['mt5_get_settings'],
        login: json['login'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_get_settings'] = mt5GetSettings;
    result['login'] = login;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5GetSettingsSend copyWith({
    int mt5GetSettings,
    String login,
  }) =>
      Mt5GetSettingsSend(
        mt5GetSettings: mt5GetSettings ?? this.mt5GetSettings,
        login: login ?? this.login,
      );
}
