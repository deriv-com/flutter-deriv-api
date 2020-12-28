/// App list send model class
abstract class AppListSendModel {
  /// Initializes
  AppListSendModel({
    @required this.appList,
  });

  /// Must be `1`
  final int appList;
}

/// App list send class
class AppListSend extends AppListSendModel {
  /// Initializes
  AppListSend({
    @required int appList,
  }) : super(
          appList: appList,
        );

  /// Creates an instance from JSON
  factory AppListSend.fromJson(Map<String, dynamic> json) => AppListSend(
        appList: json['app_list'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_list'] = appList;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppListSend copyWith({
    int appList,
  }) =>
      AppListSend(
        appList: appList ?? this.appList,
      );
}
