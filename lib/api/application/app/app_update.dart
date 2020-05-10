import 'package:flutter_deriv_api/api/application/app/app_details.dart';
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

  /// Creates an instance from JSON
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appDetails: getItemFromMap(
          json,
          itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
        ),
      );

  /// Creates a copy of instance with given parameters
  AppUpdate copyWith({
    AppDetails appDetails,
  }) =>
      AppUpdate(
        appDetails: appDetails ?? this.appDetails,
      );
}
