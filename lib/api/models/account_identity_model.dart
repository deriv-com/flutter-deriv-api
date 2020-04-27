import 'package:flutter_deriv_api/utils/helpers.dart';

import 'authentication_services_model.dart';
import 'base_model.dart';

/// The authentication status for identity.
class AccountIdentityModel extends BaseModel {
  /// Initializes
  AccountIdentityModel({
    this.expiryDate,
    this.furtherSubmissionsAllowed,
    this.services,
    this.status,
  });

  /// Instance from JSON
  factory AccountIdentityModel.fromJson(Map<String, dynamic> json) =>
      AccountIdentityModel(
        expiryDate: getDateTime(json['expiry_date']),
        furtherSubmissionsAllowed: json['further_submissions_allowed'],
        services: json['services'] == null
            ? null
            : AuthenticationServicesModel.fromJson(json['services']),
        status: json['status'],
      );

  /// This is the epoch of the document expiry date.
  final DateTime expiryDate;

  /// This represent the number times a client is allowed to submit documents
  final int furtherSubmissionsAllowed;

  /// This shows the information about the authentication services implemented
  final AuthenticationServicesModel services;

  // todo(ramin): Use EnumHelper once its ready
  /// This represent the current status for proof of identity document
  /// submitted for authentication.
  final String status;

  /// ToJson
  AccountIdentityModel copyWith({
    DateTime expiryDate,
    int furtherSubmissionsAllowed,
    AuthenticationServicesModel services,
    String status,
  }) =>
      AccountIdentityModel(
        expiryDate: expiryDate ?? this.expiryDate,
        furtherSubmissionsAllowed:
            furtherSubmissionsAllowed ?? this.furtherSubmissionsAllowed,
        services: services ?? this.services,
        status: status ?? this.status,
      );
}
