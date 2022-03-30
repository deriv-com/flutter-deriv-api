import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Logout model class
abstract class LogoutModel extends APIBaseModel {
  /// Initializes
  LogoutModel({
    this.succeeded,
  });

  /// The result of logout request which is `true`
  final bool? succeeded;
}
