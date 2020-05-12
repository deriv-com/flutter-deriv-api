import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App delete model class
class AppDeleteModel extends APIBaseModel {
  /// Initializes
  AppDeleteModel({
    this.succeeded,
  });

  /// `true` on success
  final bool succeeded;
}
