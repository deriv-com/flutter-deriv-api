import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/app_details_model.dart';

/// App update model class
abstract class AppUpdateModel extends APIBaseModel {
  /// Initializes
  AppUpdateModel({
    this.appDetails,
  });

  /// The information of the created application.
  final AppDetailsModel appDetails;
}
