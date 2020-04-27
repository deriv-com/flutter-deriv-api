import 'package:flutter_deriv_api/api/app/app_detail.dart';
import 'package:flutter_deriv_api/api/models/app_update_model.dart';

/// App update class
class AppUpdate extends AppUpdateModel {
  /// Class constructor
  AppUpdate({
    AppDetails appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates instance from json
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appDetails: json['app_update'] == null
            ? null
            : AppDetails.fromJson(json['app_update']),
      );

  /// Creates copy of instance with given parameters
  AppUpdate copyWith({
    AppDetails appDetails,
  }) =>
      AppUpdate(
        appDetails: appDetails ?? this.appDetails,
      );
}
