/// App get send model class
abstract class AppGetSendModel {
  /// Initializes
  AppGetSendModel({
    @required this.appGet,
  });

  /// Application app_id
  final int appGet;
}

/// App get send class
class AppGetSend extends AppGetSendModel {
  /// Initializes
  AppGetSend({
    @required int appGet,
  }) : super(
          appGet: appGet,
        );

  /// Creates an instance from JSON
  factory AppGetSend.fromJson(Map<String, dynamic> json) => AppGetSend(
        appGet: json['app_get'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_get'] = appGet;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppGetSend copyWith({
    int appGet,
  }) =>
      AppGetSend(
        appGet: appGet ?? this.appGet,
      );
}
