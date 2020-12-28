/// Get settings send model class
abstract class GetSettingsSendModel {
  /// Initializes
  GetSettingsSendModel({
    @required this.getSettings,
  });

  /// Must be `1`
  final int getSettings;
}

/// Get settings send class
class GetSettingsSend extends GetSettingsSendModel {
  /// Initializes
  GetSettingsSend({
    @required int getSettings,
  }) : super(
          getSettings: getSettings,
        );

  /// Creates an instance from JSON
  factory GetSettingsSend.fromJson(Map<String, dynamic> json) =>
      GetSettingsSend(
        getSettings: json['get_settings'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['get_settings'] = getSettings;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetSettingsSend copyWith({
    int getSettings,
  }) =>
      GetSettingsSend(
        getSettings: getSettings ?? this.getSettings,
      );
}
