/// App delete receive model class
abstract class AppDeleteReceiveModel {
  /// Initializes
  AppDeleteReceiveModel({
    @required this.appDelete,
  });

  /// 1 on success
  final int appDelete;
}

/// App delete receive class
class AppDeleteReceive extends AppDeleteReceiveModel {
  /// Initializes
  AppDeleteReceive({
    @required int appDelete,
  }) : super(
          appDelete: appDelete,
        );

  /// Creates an instance from JSON
  factory AppDeleteReceive.fromJson(Map<String, dynamic> json) =>
      AppDeleteReceive(
        appDelete: json['app_delete'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_delete'] = appDelete;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppDeleteReceive copyWith({
    int appDelete,
  }) =>
      AppDeleteReceive(
        appDelete: appDelete ?? this.appDelete,
      );
}
