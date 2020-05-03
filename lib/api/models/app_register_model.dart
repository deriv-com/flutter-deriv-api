import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/app_details_model.dart';

/// App register model class
abstract class AppRegisterModel extends APIBaseModel {
  /// Initializes
  AppRegisterModel({
    this.appDetails,
  });

  /// The information of the created application.
  final AppDetailsModel appDetails;
}
