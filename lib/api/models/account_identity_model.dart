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
        expiryDate: json['expiry_date'],
        furtherSubmissionsAllowed: json['further_submissions_allowed'],
        services: json['services'] == null
            ? null
            : AuthenticationServicesModel.fromJson(json['services']),
        status: json['status'],
      );

  // Properties
  /// This is the epoch of the document expiry date.
  final int expiryDate;

  /// This represent the number times a client is allowed to submit documents
  final int furtherSubmissionsAllowed;

  /// This shows the information about the authentication services implemented
  final AuthenticationServicesModel services;

  /// This represent the current status for proof of identity document
  /// submitted for authentication.
  final String status;

  /// ToJson
  AccountIdentityModel copyWith({
    int expiryDate,
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
