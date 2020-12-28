/// App delete send model class
abstract class AppDeleteSendModel {
  /// Initializes
  AppDeleteSendModel({
    @required this.appDelete,
  });

  /// Application app_id
  final int appDelete;
}

/// App delete send class
class AppDeleteSend extends AppDeleteSendModel {
  /// Initializes
  AppDeleteSend({
    @required int appDelete,
  }) : super(
          appDelete: appDelete,
        );

  /// Creates an instance from JSON
  factory AppDeleteSend.fromJson(Map<String, dynamic> json) => AppDeleteSend(
        appDelete: json['app_delete'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_delete'] = appDelete;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppDeleteSend copyWith({
    int appDelete,
  }) =>
      AppDeleteSend(
        appDelete: appDelete ?? this.appDelete,
      );
}
