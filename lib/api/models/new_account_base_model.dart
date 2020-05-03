import 'package:flutter_deriv_api/api/models/base_model.dart';

/// New account base model class
abstract class NewAccountBaseModel extends BaseModel {
  /// Initializes
  NewAccountBaseModel({
    this.clientId,
    this.oauthToken,
  });

  /// Client ID of the new account
  final String clientId;

  /// Oauth token for the client's login session (so that the user may be logged in immediately)
  final String oauthToken;
}
