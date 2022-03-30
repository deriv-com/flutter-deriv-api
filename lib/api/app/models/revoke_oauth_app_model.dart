import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Revoke oauth app model class
abstract class RevokeOauthAppModel extends APIBaseModel {
  /// Initializes
  RevokeOauthAppModel({
    this.succeeded,
  });

  /// `true` on success
  final bool? succeeded;
}
