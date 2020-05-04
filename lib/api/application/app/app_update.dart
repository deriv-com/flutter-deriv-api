import 'package:flutter_deriv_api/api/application/app/app_detail.dart';
import 'package:flutter_deriv_api/api/application/models/app_update_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App update class
class AppUpdate extends AppUpdateModel {
  /// Initializes
  AppUpdate({
    AppDetails appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates instance from json
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appDetails: getItemFromMap(
          json['app_update'],
          itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
        ),
      );

  /// Creates copy of instance with given parameters
  AppUpdate copyWith({
    AppDetails appDetails,
  }) =>
      AppUpdate(
        appDetails: appDetails ?? this.appDetails,
      );
}
