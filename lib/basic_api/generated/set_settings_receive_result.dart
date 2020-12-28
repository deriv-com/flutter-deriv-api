/// Set settings receive model class
abstract class SetSettingsReceiveModel {
  /// Initializes
  SetSettingsReceiveModel({
    @required this.setSettings,
  });

  /// 1 on success
  final int setSettings;
}

/// Set settings receive class
class SetSettingsReceive extends SetSettingsReceiveModel {
  /// Initializes
  SetSettingsReceive({
    @required int setSettings,
  }) : super(
          setSettings: setSettings,
        );

  /// Creates an instance from JSON
  factory SetSettingsReceive.fromJson(Map<String, dynamic> json) =>
      SetSettingsReceive(
        setSettings: json['set_settings'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_settings'] = setSettings;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetSettingsReceive copyWith({
    int setSettings,
  }) =>
      SetSettingsReceive(
        setSettings: setSettings ?? this.setSettings,
      );
}
