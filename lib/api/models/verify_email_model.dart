import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// Verified email
class VerifyEmailModel extends BaseModel {
  /// Initializes
  VerifyEmailModel({
    this.verified,
  });

  /// Generates an instance from JSON
  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailModel(
        verified: getBool(json['verify_email']),
      );

  /// true for success (secure code has been sent to the email address)
  final bool verified;

  /// Creates a copy with given parameters
  VerifyEmailModel copyWith({
    bool verified,
  }) =>
      VerifyEmailModel(
        verified: verified ?? this.verified,
      );
}
