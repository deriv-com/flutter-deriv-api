import 'package:flutter_deriv_api/api/app/app_detail.dart';
import 'package:flutter_deriv_api/api/models/app_register_model.dart';

/// App register class
class AppRegister extends AppRegisterModel {
  /// Class constructor
  AppRegister({
    AppDetails appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates instance from json
  factory AppRegister.fromJson(Map<String, dynamic> json) => AppRegister(
        appDetails: json['app_register'] == null
            ? null
            : AppDetails.fromJson(json['app_register']),
      );

  /// Creates copy of instance with given parameters
  AppRegister copyWith({
    AppDetails appDetails,
  }) =>
      AppRegister(
        appDetails: appDetails ?? this.appDetails,
      );
}
