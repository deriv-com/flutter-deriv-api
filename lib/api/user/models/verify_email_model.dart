import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Verify email model class
abstract class VerifyEmailModel extends APIBaseModel {
  /// Initializes
  VerifyEmailModel({
    this.verified,
  });

  /// true for success (secure code has been sent to the email address)
  final bool? verified;
}
