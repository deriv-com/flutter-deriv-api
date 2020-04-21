import 'package:flutter_deriv_api/api/models/app_delete_model.dart';

/// App delete response class
class AppDeleteResponse extends AppDeleteModel {
  /// Class constructor
  AppDeleteResponse({
    int appDelete,
  }) : super(
          appDelete: appDelete,
        );

  /// Creates instance from json
  factory AppDeleteResponse.fromJson(Map<String, dynamic> json) =>
      AppDeleteResponse(
        appDelete: json['app_delete'],
      );

  /// Creates copy of instance with given parameters
  AppDeleteResponse copyWith({
    int appDelete,
  }) =>
      AppDeleteResponse(
        appDelete: appDelete ?? this.appDelete,
      );
}
