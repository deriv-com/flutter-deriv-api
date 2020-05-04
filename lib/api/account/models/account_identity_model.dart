import 'package:flutter_deriv_api/api/account/models/authentication_services_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// The authentication status for identity.
class AccountIdentityModel extends APIBaseModel {
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
        services: getItemFromMap(
          json['services'],
          itemToTypeCallback: (dynamic map) =>
              AuthenticationServicesModel.fromJson(map),
        ),
        status: getEnumFromString(
          values: AccountIdentityStatus.values,
          name: json['status'],
        ),
      );

  /// This is the epoch of the document expiry date.
  final DateTime expiryDate;

  /// This represent the number times a client is allowed to submit documents
  final int furtherSubmissionsAllowed;

  /// This shows the information about the authentication services implemented
  final AuthenticationServicesModel services;

  /// This represent the current status for proof of identity document
  /// submitted for authentication.
  final AccountIdentityStatus status;

  /// Clones a new instance
  AccountIdentityModel copyWith({
    DateTime expiryDate,
    int furtherSubmissionsAllowed,
    AuthenticationServicesModel services,
    AccountIdentityStatus status,
  }) =>
      AccountIdentityModel(
        expiryDate: expiryDate ?? this.expiryDate,
        furtherSubmissionsAllowed:
            furtherSubmissionsAllowed ?? this.furtherSubmissionsAllowed,
        services: services ?? this.services,
        status: status ?? this.status,
      );
}
