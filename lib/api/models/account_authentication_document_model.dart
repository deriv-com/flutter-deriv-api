import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';

/// The authentication status for document.
class AccountAuthenticationDocumentModel extends BaseModel {
  /// Initializes
  AccountAuthenticationDocumentModel({
    this.expiryDate,
    this.furtherSubmissionsAllowed,
    this.status,
  });

  /// Instance from JSON
  factory AccountAuthenticationDocumentModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AccountAuthenticationDocumentModel(
        expiryDate: getDateTime(json['expiry_date']),
        furtherSubmissionsAllowed: getBool(json['further_submissions_allowed']),
        status: EnumHelper.getEnum(
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

  /// Clones a new instance
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
