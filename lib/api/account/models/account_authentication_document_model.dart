import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// The authentication status for document.
class AccountAuthenticationDocumentModel extends APIBaseModel {
  /// Initializes
  AccountAuthenticationDocumentModel({
    this.expiryDate,
    this.furtherSubmissionsAllowed,
    this.status,
  });

  /// Generate an instance from JSON
  factory AccountAuthenticationDocumentModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AccountAuthenticationDocumentModel(
        expiryDate: getDateTime(json['expiry_date']),
        furtherSubmissionsAllowed: getBool(json['further_submissions_allowed']),
        status: getEnumFromString(
          values: AccountIdentityStatus.values,
          name: json['status'],
        ),
      );

  /// This is the epoch of the document expiry date.
  final DateTime expiryDate;

  /// This represent the number of submissions allowed for client to
  /// submit documents
  final bool furtherSubmissionsAllowed;

  /// This represents the current status of the proof of address document
  /// submitted for authentication.
  final AccountIdentityStatus status;

  /// Generate a copy of instance with given parameters
  AccountAuthenticationDocumentModel copyWith({
    DateTime expiryDate,
    int furtherSubmissionsAllowed,
    AccountIdentityStatus status,
  }) =>
      AccountAuthenticationDocumentModel(
        expiryDate: expiryDate ?? this.expiryDate,
        furtherSubmissionsAllowed:
            furtherSubmissionsAllowed ?? this.furtherSubmissionsAllowed,
        status: status ?? this.status,
      );
}
