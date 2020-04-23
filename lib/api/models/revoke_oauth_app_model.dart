import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Revoke oauth app model class
abstract class RevokeOauthAppModel extends BaseModel {
  /// Class constructor
  RevokeOauthAppModel({
    this.revokeOauthApp,
  });

  /// `true` on success
  final bool revokeOauthApp;
}
