import 'package:flutter_deriv_api/api/application/app/app_detail.dart';
import 'package:flutter_deriv_api/api/application/models/app_register_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App register class
class AppRegister extends AppRegisterModel {
  /// Initializes
  AppRegister({
    AppDetails appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates an instance from json
  factory AppRegister.fromJson(Map<String, dynamic> json) => AppRegister(
        appDetails: getItemFromMap(
          json['app_register'],
          itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
        ),
      );

  /// Creates a copy of instance with given parameters
  AppRegister copyWith({
    AppDetails appDetails,
  }) =>
      AppRegister(
        appDetails: appDetails ?? this.appDetails,
      );
}
