import 'package:flutter_deriv_api/api/app/models/app_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// App update model class
abstract class AppUpdateModel extends APIBaseModel {
  /// Initializes
  AppUpdateModel({
    this.appDetails,
  });

  /// The information of the created application.
  final AppModel appDetails;
}
