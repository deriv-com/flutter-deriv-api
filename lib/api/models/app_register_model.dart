import 'package:flutter_deriv_api/api/models/app_details_model.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';

/// App register model class
abstract class AppRegisterModel extends BaseModel {
  /// Class constructor
  AppRegisterModel({
    this.appDetails,
  });

  /// The information of the created application.
  final AppDetailsModel appDetails;
}
